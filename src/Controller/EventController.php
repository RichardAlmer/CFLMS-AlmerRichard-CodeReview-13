<?php

namespace App\Controller;

use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\DateTimeType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\HttpFoundation\Request;
use App\Entity\Event;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class EventController extends AbstractController
{
    #[Route('/', name: 'event')]
    public function index(): Response
    {
        $events = $this->getDoctrine()->getRepository('App:Event')->findAll();
        return $this->render('event/index.html.twig', [
            'events' => $events
        ]);
    }
    
    #[Route('/create', name: 'event_create')]
    public function create(Request $request): Response
    {
        $event = new Event;

        $form = $this->createFormBuilder($event)
        ->add('name', TextType::class, array("attr" => array("class"=>"form-control", "style"=>"margin-bottom:15px", "placeholder"=>"Name")))
        ->add('start', DateTimeType::class, array('attr' => array('style'=>'margin-bottom:15px')))
        ->add('description', TextareaType::class, array('attr' => array('class'=> 'form-control', 'style'=>'margin-bottom:15px', "placeholder"=>"Description")))
        ->add('image', TextType::class, array("attr" => array("class"=>"form-control", "style"=>"margin-bottom:15px", "placeholder"=>"Image-URL")))
        ->add('capacity', TextType::class, array("attr" => array("class"=>"form-control", "style"=>"margin-bottom:15px", "placeholder"=>"1000")))
        ->add('email', TextType::class, array("attr" => array("class"=>"form-control", "style"=>"margin-bottom:15px", "placeholder"=>"dummy@mail.com")))
        ->add('phone', TextType::class, array("attr" => array("class"=>"form-control", "style"=>"margin-bottom:15px", "placeholder"=>"12345678")))
        ->add('country', TextType::class, array("attr" => array("class"=>"form-control", "style"=>"margin-bottom:15px", "placeholder"=>"Country")))
        ->add('address', TextType::class, array("attr" => array("class"=>"form-control", "style"=>"margin-bottom:15px", "placeholder"=>"Street 23, 12345 City")))
        ->add('url', TextType::class, array("attr" => array("class"=>"form-control", "style"=>"margin-bottom:15px", "placeholder"=>"Hompage-Url")))
        // ->add('type', TextType::class, array('attr' => array('class'=> 'form-control', 'style'=>'margin-bottom:15px', "placeholder"=>"Type")))
        ->add('type', ChoiceType::class, array('choices'=>array('Festival'=>'Festival', 'Concert'=>'Concert', 'Sport'=>'Sport'),'attr' => array('class'=> 'form-control', 'style'=>'margin-botton:15px')))
        ->add('save', SubmitType::class, array('label'=> 'Create Todo', 'attr' => array('class'=> 'btn-primary', 'style'=>'margin-bottom:15px')))

        ->getForm();

        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid()){
            $name = $form['name']->getData();
            $start = $form['start']->getData();
            $description = $form['description']->getData();
            $image = $form['image']->getData();
            $capacity = $form['capacity']->getData();
            $email = $form['email']->getData();
            $phone = $form['phone']->getData();
            $country = $form['country']->getData();
            $address = $form['address']->getData();
            $url = $form['url']->getData();
            $type = $form['type']->getData();
            
            $event->setName($name);
            $event->setStart($start);
            $event->setDescription($description);
            $event->setImage($image);
            $event->setCapacity($capacity);
            $event->setEmail($email);
            $event->setPhone($phone);
            $event->setCountry($country);
            $event->setAddress($address);
            $event->setUrl($url);
            $event->setType($type);
            
            $em = $this->getDoctrine()->getManager();
            $em->persist($event);
            $em->flush();
            $this->addFlash(
                    'notice',
                    'Event Added'
                    );
            return $this->redirectToRoute('event');
        }
        return $this->render('event/create.html.twig', [
            'form' => $form->createView()
        ]);
    }
    
    #[Route('/edit/{id}', name: 'event_edit')]
    public function edit($id, Request $request): Response
    {
        $event = $this->getDoctrine()->getRepository('App:Event')->find($id);

        $form = $this->createFormBuilder($event)
        ->add('name', TextType::class, array("attr" => array("class"=>"form-control", "style"=>"margin-bottom:15px")))
        ->add('start', DateTimeType::class, array('attr' => array('style'=>'margin-bottom:15px')))
        ->add('description', TextareaType::class, array('attr' => array('class'=> 'form-control', 'style'=>'margin-bottom:15px')))
        ->add('image', TextType::class, array("attr" => array("class"=>"form-control", "style"=>"margin-bottom:15px")))
        ->add('capacity', TextType::class, array("attr" => array("class"=>"form-control", "style"=>"margin-bottom:15px")))
        ->add('email', TextType::class, array("attr" => array("class"=>"form-control", "style"=>"margin-bottom:15px")))
        ->add('phone', TextType::class, array("attr" => array("class"=>"form-control", "style"=>"margin-bottom:15px")))
        ->add('country', TextType::class, array("attr" => array("class"=>"form-control", "style"=>"margin-bottom:15px")))
        ->add('address', TextType::class, array("attr" => array("class"=>"form-control", "style"=>"margin-bottom:15px")))
        ->add('url', TextType::class, array("attr" => array("class"=>"form-control", "style"=>"margin-bottom:15px")))
        // ->add('type', TextType::class, array('attr' => array('class'=> 'form-control', 'style'=>'margin-bottom:15px')))
        ->add('type', ChoiceType::class, array('choices'=>array('Festival'=>'Festival', 'Concert'=>'Concert', 'Sport'=>'Sport'),'attr' => array('class'=> 'form-control', 'style'=>'margin-botton:15px')))
        ->add('save', SubmitType::class, array('label'=> 'Update Todo', 'attr' => array('class'=> 'btn-primary', 'style'=>'margin-bottom:15px')))

        ->getForm();

        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid()){
            $name = $form['name']->getData();
            $start = $form['start']->getData();
            $description = $form['description']->getData();
            $image = $form['image']->getData();
            $capacity = $form['capacity']->getData();
            $email = $form['email']->getData();
            $phone = $form['phone']->getData();
            $country = $form['country']->getData();
            $address = $form['address']->getData();
            $url = $form['url']->getData();
            $type = $form['type']->getData();
            $em = $this->getDoctrine()->getManager();
            $event->setName($name);
            $event->setStart($start);
            $event->setDescription($description);
            $event->setImage($image);
            $event->setCapacity($capacity);
            $event->setEmail($email);
            $event->setPhone($phone);
            $event->setCountry($country);
            $event->setAddress($address);
            $event->setUrl($url);
            $event->setType($type);
            
            $em->flush();
            $this->addFlash(
                    'notice',
                    'Event Updated'
                    );
            return $this->redirectToRoute('event');
        }
        return $this->render('event/edit.html.twig', [
            'event' => $event,
            'form' => $form->createView()
        ]);
    }

    #[Route('/details/{id}', name: 'event_details')]
    public function details($id): Response
    {
        $event = $this->getDoctrine()->getRepository('App:Event')->find($id);
        return $this->render('event/details.html.twig', [
            'event' => $event
        ]);
    }

    #[Route('/delete/{id}', name: 'event_delete')]
    public function delete($id){
        $em = $this->getDoctrine()->getManager();
        $event = $em->getRepository('App:Event')->find($id);
        $em->remove($event);
        $em->flush();
        $this->addFlash(
            'notice',
            'Event Removed'
        );
        return $this->redirectToRoute('event');
    }

    #[Route('/type/{type}', name: 'event_type')]
    public function showTypeEvent($type): Response
    {
        $events = $this->getDoctrine()->getRepository(Event::class)->findEventByType($type);
        // dd($events);
        return $this->render('event/type.html.twig', [
            'events' => $events,
            'type' => $type
        ]);
    }
}

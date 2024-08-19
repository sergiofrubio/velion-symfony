<?php

namespace App\Form;

use App\Entity\Appointment;
use App\Entity\User;
use App\Entity\Specialization;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\DateType;
use Symfony\Component\Form\Extension\Core\Type\IntegerType;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\FormEvent;
use Symfony\Component\Form\FormEvents;
use Symfony\Component\Form\FormInterface;

class AppointmentType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('patient', EntityType::class, [
                'class' => User::class,
                'choice_label' => function (User $user) {
                    return $user->getName() . ' ' . $user->getSurname() . ' (ID: ' . $user->getId() . ')';
                },
                'placeholder' => 'Select patient',
            ])
            ->add('specialization', EntityType::class, [
                'class' => Specialization::class,
                'choice_label' => function (Specialization $specializacion) {
                    return $specializacion->getDescription();
                },
                'placeholder' => 'Select specialization',
            ])
            ->add('therapist', EntityType::class, [
                'class' => User::class,
                'choice_label' => function (User $user) {
                    return $user->getName() . ' ' . $user->getSurname() . ' (ID: ' . $user->getId() . ')';
                },
                'placeholder' => 'Select therapist',
            ])
            ->add('date', DateType::class, [
                'widget' => 'single_text',
            ])
            ->add('time', ChoiceType::class, [
                'choices' => [], // Inicialmente vacío, se llenará dinámicamente
                'placeholder' => 'Select time',
            ]);
            // ->add('duration', IntegerType::class, [
            //     'label' => 'Duración (minutos)',
            // ]);
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Appointment::class,
        ]);
    }
}


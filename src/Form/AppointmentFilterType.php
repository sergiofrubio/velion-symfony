<?php
// src/Form/AppointmentFilterType.php

namespace App\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\DateType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;

class AppointmentFilterType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('usuario_id', TextType::class, [
                'required' => false,
                'label' => 'Filtrar por ID de paciente...'
            ])
            ->add('fecha_hora', DateType::class, [
                'widget' => 'single_text',
                'required' => false,
                'label' => 'Fecha'
            ])
            ->add('estado', ChoiceType::class, [
                'choices' => [
                    'Programada' => 'Programada',
                    'Realizada' => 'Realizada',
                    'Cancelada' => 'Cancelada'
                ],
                'required' => false,
                'placeholder' => 'Selecciona un estado'
            ])
            ->add('filtrar', SubmitType::class, ['label' => 'Filtrar']);
    }
}

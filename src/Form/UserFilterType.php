<?php
// src/Form/UserFilterType.php

namespace App\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class UserFilterType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('usuario_id', TextType::class, [
                'required' => false,
                'label' => 'ID de Usuario',
            ])
            ->add('rol', ChoiceType::class, [
                'choices' => [
                    'Selecciona tu rol' => '',
                    'Administrador' => 'ROLE_ADMIN',
                    'Paciente' => 'paciente',
                    'Fisioterapeuta' => 'fisioterapeuta',
                ],
                'required' => false,
                'label' => 'Rol',
            ]);
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'method' => 'GET',
            'csrf_protection' => false,
        ]);
    }
}

<?php

namespace App\Form;

use App\Entity\User;
use App\Entity\Specialization;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;
use Symfony\Component\Validator\Constraints\Length;
use Symfony\Component\Validator\Constraints\NotBlank;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;

class UserType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('id', TextType::class, [
                'attr' => ['class' => 'form-control']
            ])
            ->add('name', TextType::class, [
                'attr' => ['class' => 'form-control'],
            ])
            ->add('surname', TextType::class, [
                'attr' => ['class' => 'form-control']
            ])
            ->add('birth_date', null, [
                'widget' => 'single_text',
                'attr' => ['class' => 'form-control']
            ])
            ->add('address', TextType::class, [
                'attr' => ['class' => 'form-control']
            ])
            ->add('city', TextType::class, [
                'attr' => ['class' => 'form-control']
            ])
            ->add('province', TextType::class, [
                'attr' => ['class' => 'form-control']
            ])
            ->add('zip', TextType::class, [
                'attr' => ['class' => 'form-control']
            ])
            ->add('email', TextType::class, [
                'attr' => ['class' => 'form-control']
            ])
            ->add('roles', ChoiceType::class, [
                'choices' => [
                    'User' => 'ROLE_USER',
                    'Admin' => 'ROLE_ADMIN',
                    'Manager' => 'ROLE_MANAGER',
                ],
                'expanded' => true,   // Usar checkboxes en lugar de select
                'multiple' => true,   // Permitir seleccionar múltiples roles
                'choice_attr' => function($choice, $key, $value) {
                    // Generar un ID único para cada checkbox
                    return ['class' => 'form-check-input', 'id' => 'inlineCheckbox_' . $value];
                },
                'label' => 'Roles', // Para gestionar la etiqueta manualmente en la vista
            ])
            ->add('specialization', EntityType::class, [
                'class' => Specialization::class,
                'choice_label' => function (Specialization $specializacion) {
                    return $specializacion->getDescription();
                },
                // 'choice_attr' => function($choice, $key, $value) {
                //     // Generar un ID único para cada checkbox
                //     return ['class' => 'form-check-input', 'id' => 'inlineCheckbox_' . $value];
                // },
                'expanded' => true,
                'multiple' => true
            ])
            ->add('plainPassword', PasswordType::class, [
                // instead of being set onto the object directly,
                // this is read and encoded in the controller
                'label' => 'Password',
                'attr' => ['class' => 'form-control'],
                'mapped' => false,
                // 'attr' => ['autocomplete' => 'new-password'],
                'constraints' => [
                    new NotBlank([
                        'message' => 'Por favor, introduzca una contraseña',
                    ]),
                    new Length([
                        'min' => 6,
                        'minMessage' => 'Su contraseña debe tener, al menos {{ limit }} carácteres',
                        // max length allowed by Symfony for security reasons
                        'max' => 4096,
                    ]),
                ],
            ])
            ->add('genre', ChoiceType::class, [
                'label' => 'Genre',
                'choices' => [
                    'Male' => 'Male',
                    'Female' => 'Female',
                ],
                'attr' => ['class' => 'form-control'],
                'placeholder' => 'Select genre',
            ])
            ->add('phone', TextType::class, [
                'attr' => ['class' => 'form-control']
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => User::class,
        ]);
    }
}

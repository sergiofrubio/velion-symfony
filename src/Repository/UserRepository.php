<?php

namespace App\Repository;

use App\Entity\User;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<User>
 */
class UserRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, User::class);
    }

    //    /**
    //     * @return User[] Returns an array of User objects
    //     */
    //    public function findByExampleField($value): array
    //    {
    //        return $this->createQueryBuilder('u')
    //            ->andWhere('u.exampleField = :val')
    //            ->setParameter('val', $value)
    //            ->orderBy('u.id', 'ASC')
    //            ->setMaxResults(10)
    //            ->getQuery()
    //            ->getResult()
    //        ;
    //    }

    //    public function findOneBySomeField($value): ?User
    //    {
    //        return $this->createQueryBuilder('u')
    //            ->andWhere('u.exampleField = :val')
    //            ->setParameter('val', $value)
    //            ->getQuery()
    //            ->getOneOrNullResult()
    //        ;
    //    }

    public function findAllUsers(){
        return $this->getEntityManager()
        ->createQuery(
            'SELECT u.id, u.name, u.surname, u.birth_date, u.address, u.city, u.province, u.zip, u.email, u.password, u.roles, u.genre, u.phone, u.isVerified
             FROM App\Entity\User u'
        );
    }

    public function getFilteredUsersQuery($filters)
    {
        $queryBuilder = $this->createQueryBuilder('u');

        if (!empty($filters['usuario_id'])) {
            $queryBuilder->andWhere('u.id LIKE :usuario_id')
                         ->setParameter('usuario_id', '%'.$filters['usuario_id'].'%');
        }

        if (!empty($filters['rol'])) {
            $queryBuilder->andWhere('u.roles LIKE :rol')
                         ->setParameter('rol', '%'.$filters['rol'].'%');
        }

        return $queryBuilder->getQuery();
    }
}

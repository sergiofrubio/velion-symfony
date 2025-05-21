<?php

namespace App\Entity;

use App\Repository\TherapistRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: TherapistRepository::class)]
class Therapist
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 255)]
    private ?string $license_number = null;

    #[ORM\OneToOne(inversedBy: 'therapist', cascade: ['persist', 'remove'])]
    #[ORM\JoinColumn(nullable: false)]
    private ?User $user = null;

    /**
     * @var Collection<int, Appointment>
     */
    #[ORM\OneToMany(targetEntity: Appointment::class, mappedBy: 'therapist')]
    private Collection $appointments;

    /**
     * @var Collection<int, MedicalReport>
     */
    #[ORM\OneToMany(targetEntity: MedicalReport::class, mappedBy: 'therapist')]
    private Collection $medicalReports;

    public function __construct()
    {
        $this->appointments = new ArrayCollection();
        $this->medicalReports = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getLicenseNumber(): ?string
    {
        return $this->license_number;
    }

    public function setLicenseNumber(string $license_number): static
    {
        $this->license_number = $license_number;

        return $this;
    }

    public function getUser(): ?User
    {
        return $this->user;
    }

    public function setUser(User $user): static
    {
        $this->user = $user;

        return $this;
    }

    /**
     * @return Collection<int, Appointment>
     */
    public function getAppointments(): Collection
    {
        return $this->appointments;
    }

    public function addAppointment(Appointment $appointment): static
    {
        if (!$this->appointments->contains($appointment)) {
            $this->appointments->add($appointment);
            $appointment->settherapist($this);
        }

        return $this;
    }

    public function removeAppointment(Appointment $appointment): static
    {
        if ($this->appointments->removeElement($appointment)) {
            // set the owning side to null (unless already changed)
            if ($appointment->gettherapist() === $this) {
                $appointment->settherapist(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection<int, MedicalReport>
     */
    public function getMedicalReports(): Collection
    {
        return $this->medicalReports;
    }

    public function addMedicalReport(MedicalReport $medicalReport): static
    {
        if (!$this->medicalReports->contains($medicalReport)) {
            $this->medicalReports->add($medicalReport);
            $medicalReport->settherapist($this);
        }

        return $this;
    }

    public function removeMedicalReport(MedicalReport $medicalReport): static
    {
        if ($this->medicalReports->removeElement($medicalReport)) {
            // set the owning side to null (unless already changed)
            if ($medicalReport->gettherapist() === $this) {
                $medicalReport->settherapist(null);
            }
        }

        return $this;
    }
}

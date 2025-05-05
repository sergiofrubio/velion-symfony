<?php

namespace App\Entity;

use App\Repository\UserRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;
use Symfony\Component\Security\Core\User\PasswordAuthenticatedUserInterface;
use Symfony\Component\Security\Core\User\UserInterface;

#[ORM\Entity(repositoryClass: UserRepository::class)]
#[ORM\Table(name: '`user`')]
#[UniqueEntity(fields: ['email'], message: 'There is already an account with this email')]
class User implements UserInterface, PasswordAuthenticatedUserInterface
{
    #[ORM\Id]
    //#[ORM\GeneratedValue]
    #[ORM\Column (length: 9)]
    private ?string $id = null;

    #[ORM\Column(length: 255, nullable: true)]
    private ?string $name = null;

    #[ORM\Column(length: 255, nullable: true)]
    private ?string $surname = null;

    #[ORM\Column(type: Types::DATE_MUTABLE, nullable: true)]
    private ?\DateTimeInterface $birth_date = null;

    #[ORM\Column(length: 255, nullable: true)]
    private ?string $address = null;

    #[ORM\Column(length: 255, nullable: true)]
    private ?string $city = null;

    #[ORM\Column(length: 255, nullable: true)]
    private ?string $province = null;

    #[ORM\Column(nullable: true)]
    private ?int $zip = null;

    #[ORM\Column(length: 255, unique: true)]
    private ?string $email = null;

    #[ORM\Column(type: 'json')]
    private array $roles = [];

    #[ORM\Column(length: 255)]
    private ?string $password = null;

    #[ORM\Column(length: 255)]
    private ?string $genre = null;

    #[ORM\Column(length: 9, nullable: true)]
    private ?int $phone = null;

    #[ORM\Column]
    private bool $isVerified = false;

    /**
     * @var Collection<int, Appointment>
     */
    #[ORM\OneToMany(targetEntity: Appointment::class, mappedBy: 'patient')]
    private Collection $appointments;

    /**
     * @var Collection<int, Appointment>
     */
    #[ORM\OneToMany(mappedBy: 'therapist', targetEntity: Appointment::class)]
    private Collection $appointmentsAsTherapist;

    /**
     * @var Collection<int, Specialization>
     */
    #[ORM\ManyToMany(targetEntity: Specialization::class, inversedBy: 'users')]
    private Collection $specialization;

    /**
     * @var Collection<int, Invoice>
     */
    #[ORM\OneToMany(targetEntity: Invoice::class, mappedBy: 'customer')]
    private Collection $invoices;

    /**
     * @var Collection<int, MedicalReport>
     */
    #[ORM\OneToMany(targetEntity: MedicalReport::class, mappedBy: 'patient')]
    private Collection $medicalReports;

    public function __construct()
    {
        $this->appointments = new ArrayCollection();
        $this->appointmentsAsTherapist = new ArrayCollection();
        $this->specialization = new ArrayCollection();
        $this->invoices = new ArrayCollection();
        $this->medicalReports = new ArrayCollection();
    }

    public function getId(): ?string
    {
        return $this->id;
    }

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(?string $name): static
    {
        $this->name = $name;

        return $this;
    }

    public function getSurname(): ?string
    {
        return $this->surname;
    }

    public function setSurname(?string $surname): static
    {
        $this->surname = $surname;

        return $this;
    }

    public function getBirthDate(): ?\DateTimeInterface
    {
        return $this->birth_date;
    }

    public function setBirthDate(?\DateTimeInterface $birth_date): static
    {
        $this->birth_date = $birth_date;

        return $this;
    }

    public function getAddress(): ?string
    {
        return $this->address;
    }

    public function setAddress(?string $address): static
    {
        $this->address = $address;

        return $this;
    }

    public function getCity(): ?string
    {
        return $this->city;
    }

    public function setCity(?string $city): static
    {
        $this->city = $city;

        return $this;
    }

    public function setId(?string $id): static
    {
        $this->id = $id;

        return $this;
    }

    public function getProvince(): ?string
    {
        return $this->province;
    }

    public function setProvince(?string $province): static
    {
        $this->province = $province;

        return $this;
    }

    public function getZip(): ?int
    {
        return $this->zip;
    }

    public function setZip(?int $zip): static
    {
        $this->zip = $zip;

        return $this;
    }

    public function getEmail(): ?string
    {
        return $this->email;
    }

    public function setEmail(string $email): static
    {
        $this->email = $email;

        return $this;
    }

    public function getPassword(): ?string
    {
        return $this->password;
    }

    public function setPassword(string $password): static
    {
        $this->password = $password;

        return $this;
    }
    public function getUserIdentifier(): string
    {
        return (string) $this->email;
    }

    public function eraseCredentials(): void
    {}

    public function getRoles(): array
    {
        $roles = $this->roles;
        // guarantee every user at least has ROLE_USER
        $roles[] = 'ROLE_USER';

        return array_unique($roles);
    }

    public function setRoles(array $roles): self
    {
        $this->roles = $roles;

        return $this;
    }

    public function getGenre(): ?string
    {
        return $this->genre;
    }

    public function setGenre(string $genre): static
    {
        $this->genre = $genre;

        return $this;
    }

    public function getPhone(): ?int
    {
        return $this->phone;
    }

    public function setPhone(?int $phone): static
    {
        $this->phone = $phone;

        return $this;
    }

    public function isVerified(): bool
    {
        return $this->isVerified;
    }

    public function setVerified(bool $isVerified): static
    {
        $this->isVerified = $isVerified;

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
            $appointment->setPatient($this);
        }

        return $this;
    }

    public function removeAppointment(Appointment $appointment): static
    {
        if ($this->appointments->removeElement($appointment)) {
            // set the owning side to null (unless already changed)
            if ($appointment->getPatient() === $this) {
                $appointment->setPatient(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection<int, Appointment>
     */
    public function getAppointmentsAsTherapist(): Collection
    {
        return $this->appointmentsAsTherapist;
    }

    public function addAppointmentAsTherapist(Appointment $appointment): static
    {
        if (!$this->appointmentsAsTherapist->contains($appointment)) {
            $this->appointmentsAsTherapist->add($appointment);
            $appointment->setTherapist($this);
        }

        return $this;
    }

    public function removeAppointmentAsTherapist(Appointment $appointment): static
    {
        if ($this->appointmentsAsTherapist->removeElement($appointment)) {
            // set the owning side to null (unless already changed)
            if ($appointment->getTherapist() === $this) {
                $appointment->setTherapist(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection<int, Specialization>
     */
    public function getSpecialization(): Collection
    {
        return $this->specialization;
    }

    public function addSpecialization(Specialization $specialization): static
    {
        if (!$this->specialization->contains($specialization)) {
            $this->specialization->add($specialization);
        }

        return $this;
    }

    public function removeSpecialization(Specialization $specialization): static
    {
        $this->specialization->removeElement($specialization);

        return $this;
    }

    /**
     * @return Collection<int, Invoice>
     */
    public function getInvoices(): Collection
    {
        return $this->invoices;
    }

    public function addInvoice(Invoice $invoice): static
    {
        if (!$this->invoices->contains($invoice)) {
            $this->invoices->add($invoice);
            $invoice->setCustomer($this);
        }

        return $this;
    }

    public function removeInvoice(Invoice $invoice): static
    {
        if ($this->invoices->removeElement($invoice)) {
            // set the owning side to null (unless already changed)
            if ($invoice->getCustomer() === $this) {
                $invoice->setCustomer(null);
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
            $medicalReport->setPatient($this);
        }

        return $this;
    }

    public function removeMedicalReport(MedicalReport $medicalReport): static
    {
        if ($this->medicalReports->removeElement($medicalReport)) {
            // set the owning side to null (unless already changed)
            if ($medicalReport->getPatient() === $this) {
                $medicalReport->setPatient(null);
            }
        }

        return $this;
    }

}

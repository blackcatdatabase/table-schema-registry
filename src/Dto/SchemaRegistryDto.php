<?php
declare(strict_types=1);

namespace BlackCat\Database\Packages\SchemaRegistry\Dto;

/**
 * Simple immutable DTO with public readonly properties.
 * - No logic; just a data carrier.
 * - Strong types enforce the contract across layers.
 */
final class SchemaRegistryDto implements \JsonSerializable {
    public function __construct(
        public readonly int $id,
        public readonly string $systemName,
        public readonly string $component,
        public readonly string $version,
        public readonly ?string $checksum,
        public readonly \DateTimeImmutable $appliedAt,
        public readonly array|null $meta
    ) {}

    /** Suitable for serialization/logging (without large blobs). */
    public function toArray(): array {
        return get_object_vars($this);
    }

    /** toArray() without null values - for clean logging/diffs. */
    public function toArrayNonNull(): array {
        return array_filter(get_object_vars($this), static fn($v) => $v !== null);
    }

    public function jsonSerialize(): array {
       $a = $this->toArray();
       foreach ($a as $k => $v) {
           if ($v instanceof \DateTimeInterface) {
               // ISO-8601 with a timezone; switch to 'Y-m-d H:i:s.u' if needed
               $a[$k] = $v->format(\DateTimeInterface::ATOM);
           }
       }
       return $a;
   }
}

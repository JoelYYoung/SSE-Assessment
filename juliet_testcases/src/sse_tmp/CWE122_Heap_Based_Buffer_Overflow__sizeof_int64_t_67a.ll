; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_67a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_67a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_67_structType = type { i64* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_67_bad() #0 !dbg !17 {
entry:
  %data = alloca i64*, align 8
  %myStruct = alloca %struct._CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_67_structType, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !21, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata %struct._CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_67_structType* %myStruct, metadata !23, metadata !DIExpression()), !dbg !28
  store i64* null, i64** %data, align 8, !dbg !29
  %call = call noalias align 16 i8* @malloc(i64 8) #4, !dbg !30
  %0 = bitcast i8* %call to i64*, !dbg !31
  store i64* %0, i64** %data, align 8, !dbg !32
  %1 = load i64*, i64** %data, align 8, !dbg !33
  store i64 2147483643, i64* %1, align 8, !dbg !34
  %2 = load i64*, i64** %data, align 8, !dbg !35
  %structFirst = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_67_structType* %myStruct, i32 0, i32 0, !dbg !36
  store i64* %2, i64** %structFirst, align 8, !dbg !37
  %coerce.dive = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_67_structType* %myStruct, i32 0, i32 0, !dbg !38
  %3 = load i64*, i64** %coerce.dive, align 8, !dbg !38
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_67b_badSink(i64* %3), !dbg !38
  ret void, !dbg !39
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_67b_badSink(i64*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_67_good() #0 !dbg !40 {
entry:
  call void @goodG2B(), !dbg !41
  ret void, !dbg !42
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !43 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !50, metadata !DIExpression()), !dbg !51
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !52, metadata !DIExpression()), !dbg !53
  %call = call i64 @time(i64* null) #4, !dbg !54
  %conv = trunc i64 %call to i32, !dbg !55
  call void @srand(i32 %conv) #4, !dbg !56
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !57
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_67_good(), !dbg !58
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !59
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !60
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_67_bad(), !dbg !61
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !62
  ret i32 0, !dbg !63
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !64 {
entry:
  %data = alloca i64*, align 8
  %myStruct = alloca %struct._CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_67_structType, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !65, metadata !DIExpression()), !dbg !66
  call void @llvm.dbg.declare(metadata %struct._CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_67_structType* %myStruct, metadata !67, metadata !DIExpression()), !dbg !68
  store i64* null, i64** %data, align 8, !dbg !69
  %call = call noalias align 16 i8* @malloc(i64 8) #4, !dbg !70
  %0 = bitcast i8* %call to i64*, !dbg !71
  store i64* %0, i64** %data, align 8, !dbg !72
  %1 = load i64*, i64** %data, align 8, !dbg !73
  store i64 2147483643, i64* %1, align 8, !dbg !74
  %2 = load i64*, i64** %data, align 8, !dbg !75
  %structFirst = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_67_structType* %myStruct, i32 0, i32 0, !dbg !76
  store i64* %2, i64** %structFirst, align 8, !dbg !77
  %coerce.dive = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_67_structType* %myStruct, i32 0, i32 0, !dbg !78
  %3 = load i64*, i64** %coerce.dive, align 8, !dbg !78
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_67b_goodG2BSink(i64* %3), !dbg !78
  ret void, !dbg !79
}

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_67b_goodG2BSink(i64*) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_67a.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !10}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !6, line: 27, baseType: !7)
!6 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !8, line: 44, baseType: !9)
!8 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!9 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 7, !"uwtable", i32 1}
!15 = !{i32 7, !"frame-pointer", i32 2}
!16 = !{!"clang version 13.0.0"}
!17 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_67_bad", scope: !18, file: !18, line: 29, type: !19, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!18 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_67a.c", directory: "/home/joelyang/SSE-Assessment")
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !DILocalVariable(name: "data", scope: !17, file: !18, line: 31, type: !4)
!22 = !DILocation(line: 31, column: 15, scope: !17)
!23 = !DILocalVariable(name: "myStruct", scope: !17, file: !18, line: 32, type: !24)
!24 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_67_structType", file: !18, line: 22, baseType: !25)
!25 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_67_structType", file: !18, line: 19, size: 64, elements: !26)
!26 = !{!27}
!27 = !DIDerivedType(tag: DW_TAG_member, name: "structFirst", scope: !25, file: !18, line: 21, baseType: !4, size: 64)
!28 = !DILocation(line: 32, column: 69, scope: !17)
!29 = !DILocation(line: 34, column: 10, scope: !17)
!30 = !DILocation(line: 37, column: 23, scope: !17)
!31 = !DILocation(line: 37, column: 12, scope: !17)
!32 = !DILocation(line: 37, column: 10, scope: !17)
!33 = !DILocation(line: 38, column: 6, scope: !17)
!34 = !DILocation(line: 38, column: 11, scope: !17)
!35 = !DILocation(line: 39, column: 28, scope: !17)
!36 = !DILocation(line: 39, column: 14, scope: !17)
!37 = !DILocation(line: 39, column: 26, scope: !17)
!38 = !DILocation(line: 40, column: 5, scope: !17)
!39 = !DILocation(line: 41, column: 1, scope: !17)
!40 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_67_good", scope: !18, file: !18, line: 63, type: !19, scopeLine: 64, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!41 = !DILocation(line: 65, column: 5, scope: !40)
!42 = !DILocation(line: 66, column: 1, scope: !40)
!43 = distinct !DISubprogram(name: "main", scope: !18, file: !18, line: 78, type: !44, scopeLine: 79, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!44 = !DISubroutineType(types: !45)
!45 = !{!46, !46, !47}
!46 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!47 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !48, size: 64)
!48 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !49, size: 64)
!49 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!50 = !DILocalVariable(name: "argc", arg: 1, scope: !43, file: !18, line: 78, type: !46)
!51 = !DILocation(line: 78, column: 14, scope: !43)
!52 = !DILocalVariable(name: "argv", arg: 2, scope: !43, file: !18, line: 78, type: !47)
!53 = !DILocation(line: 78, column: 27, scope: !43)
!54 = !DILocation(line: 81, column: 22, scope: !43)
!55 = !DILocation(line: 81, column: 12, scope: !43)
!56 = !DILocation(line: 81, column: 5, scope: !43)
!57 = !DILocation(line: 83, column: 5, scope: !43)
!58 = !DILocation(line: 84, column: 5, scope: !43)
!59 = !DILocation(line: 85, column: 5, scope: !43)
!60 = !DILocation(line: 88, column: 5, scope: !43)
!61 = !DILocation(line: 89, column: 5, scope: !43)
!62 = !DILocation(line: 90, column: 5, scope: !43)
!63 = !DILocation(line: 92, column: 5, scope: !43)
!64 = distinct !DISubprogram(name: "goodG2B", scope: !18, file: !18, line: 50, type: !19, scopeLine: 51, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DILocalVariable(name: "data", scope: !64, file: !18, line: 52, type: !4)
!66 = !DILocation(line: 52, column: 15, scope: !64)
!67 = !DILocalVariable(name: "myStruct", scope: !64, file: !18, line: 53, type: !24)
!68 = !DILocation(line: 53, column: 69, scope: !64)
!69 = !DILocation(line: 55, column: 10, scope: !64)
!70 = !DILocation(line: 57, column: 23, scope: !64)
!71 = !DILocation(line: 57, column: 12, scope: !64)
!72 = !DILocation(line: 57, column: 10, scope: !64)
!73 = !DILocation(line: 58, column: 6, scope: !64)
!74 = !DILocation(line: 58, column: 11, scope: !64)
!75 = !DILocation(line: 59, column: 28, scope: !64)
!76 = !DILocation(line: 59, column: 14, scope: !64)
!77 = !DILocation(line: 59, column: 26, scope: !64)
!78 = !DILocation(line: 60, column: 5, scope: !64)
!79 = !DILocation(line: 61, column: 1, scope: !64)

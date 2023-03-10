; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_65a.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_65a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_65_bad() #0 !dbg !19 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %funcPtr = alloca void (%struct._twoIntsStruct*)*, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !23, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata void (%struct._twoIntsStruct*)** %funcPtr, metadata !25, metadata !DIExpression()), !dbg !29
  store void (%struct._twoIntsStruct*)* @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_65b_badSink, void (%struct._twoIntsStruct*)** %funcPtr, align 8, !dbg !29
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !30, metadata !DIExpression()), !dbg !31
  %0 = alloca i8, i64 400, align 16, !dbg !32
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !33
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !31
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !34, metadata !DIExpression()), !dbg !35
  %2 = alloca i8, i64 800, align 16, !dbg !36
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !37
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !35
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !38
  store %struct._twoIntsStruct* %4, %struct._twoIntsStruct** %data, align 8, !dbg !39
  %5 = load void (%struct._twoIntsStruct*)*, void (%struct._twoIntsStruct*)** %funcPtr, align 8, !dbg !40
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !41
  call void %5(%struct._twoIntsStruct* %6), !dbg !40
  ret void, !dbg !42
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_65b_badSink(%struct._twoIntsStruct*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_65_good() #0 !dbg !43 {
entry:
  call void @goodG2B(), !dbg !44
  ret void, !dbg !45
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !46 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !52, metadata !DIExpression()), !dbg !53
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !54, metadata !DIExpression()), !dbg !55
  %call = call i64 @time(i64* null) #4, !dbg !56
  %conv = trunc i64 %call to i32, !dbg !57
  call void @srand(i32 %conv) #4, !dbg !58
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !59
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_65_good(), !dbg !60
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !61
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !62
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_65_bad(), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !64
  ret i32 0, !dbg !65
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !66 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %funcPtr = alloca void (%struct._twoIntsStruct*)*, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !67, metadata !DIExpression()), !dbg !68
  call void @llvm.dbg.declare(metadata void (%struct._twoIntsStruct*)** %funcPtr, metadata !69, metadata !DIExpression()), !dbg !70
  store void (%struct._twoIntsStruct*)* @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_65b_goodG2BSink, void (%struct._twoIntsStruct*)** %funcPtr, align 8, !dbg !70
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !71, metadata !DIExpression()), !dbg !72
  %0 = alloca i8, i64 400, align 16, !dbg !73
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !74
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !72
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !75, metadata !DIExpression()), !dbg !76
  %2 = alloca i8, i64 800, align 16, !dbg !77
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !78
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !76
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !79
  store %struct._twoIntsStruct* %4, %struct._twoIntsStruct** %data, align 8, !dbg !80
  %5 = load void (%struct._twoIntsStruct*)*, void (%struct._twoIntsStruct*)** %funcPtr, align 8, !dbg !81
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !82
  call void %5(%struct._twoIntsStruct* %6), !dbg !81
  ret void, !dbg !83
}

declare dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_65b_goodG2BSink(%struct._twoIntsStruct*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_65a.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !12}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !6, line: 100, baseType: !7)
!6 = !DIFile(filename: "./testcasesupport/std_testcase.h", directory: "/home/joelyang/SSE-Assessment")
!7 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !6, line: 96, size: 64, elements: !8)
!8 = !{!9, !11}
!9 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !7, file: !6, line: 98, baseType: !10, size: 32)
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !7, file: !6, line: 99, baseType: !10, size: 32, offset: 32)
!12 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"clang version 13.0.0"}
!19 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_65_bad", scope: !20, file: !20, line: 24, type: !21, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!20 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_65a.c", directory: "/home/joelyang/SSE-Assessment")
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !19, file: !20, line: 26, type: !4)
!24 = !DILocation(line: 26, column: 21, scope: !19)
!25 = !DILocalVariable(name: "funcPtr", scope: !19, file: !20, line: 28, type: !26)
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 64)
!27 = !DISubroutineType(types: !28)
!28 = !{null, !4}
!29 = !DILocation(line: 28, column: 12, scope: !19)
!30 = !DILocalVariable(name: "dataBadBuffer", scope: !19, file: !20, line: 29, type: !4)
!31 = !DILocation(line: 29, column: 21, scope: !19)
!32 = !DILocation(line: 29, column: 54, scope: !19)
!33 = !DILocation(line: 29, column: 37, scope: !19)
!34 = !DILocalVariable(name: "dataGoodBuffer", scope: !19, file: !20, line: 30, type: !4)
!35 = !DILocation(line: 30, column: 21, scope: !19)
!36 = !DILocation(line: 30, column: 55, scope: !19)
!37 = !DILocation(line: 30, column: 38, scope: !19)
!38 = !DILocation(line: 33, column: 12, scope: !19)
!39 = !DILocation(line: 33, column: 10, scope: !19)
!40 = !DILocation(line: 35, column: 5, scope: !19)
!41 = !DILocation(line: 35, column: 13, scope: !19)
!42 = !DILocation(line: 36, column: 1, scope: !19)
!43 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_65_good", scope: !20, file: !20, line: 56, type: !21, scopeLine: 57, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!44 = !DILocation(line: 58, column: 5, scope: !43)
!45 = !DILocation(line: 59, column: 1, scope: !43)
!46 = distinct !DISubprogram(name: "main", scope: !20, file: !20, line: 71, type: !47, scopeLine: 72, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!47 = !DISubroutineType(types: !48)
!48 = !{!10, !10, !49}
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !50, size: 64)
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !51, size: 64)
!51 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!52 = !DILocalVariable(name: "argc", arg: 1, scope: !46, file: !20, line: 71, type: !10)
!53 = !DILocation(line: 71, column: 14, scope: !46)
!54 = !DILocalVariable(name: "argv", arg: 2, scope: !46, file: !20, line: 71, type: !49)
!55 = !DILocation(line: 71, column: 27, scope: !46)
!56 = !DILocation(line: 74, column: 22, scope: !46)
!57 = !DILocation(line: 74, column: 12, scope: !46)
!58 = !DILocation(line: 74, column: 5, scope: !46)
!59 = !DILocation(line: 76, column: 5, scope: !46)
!60 = !DILocation(line: 77, column: 5, scope: !46)
!61 = !DILocation(line: 78, column: 5, scope: !46)
!62 = !DILocation(line: 81, column: 5, scope: !46)
!63 = !DILocation(line: 82, column: 5, scope: !46)
!64 = !DILocation(line: 83, column: 5, scope: !46)
!65 = !DILocation(line: 85, column: 5, scope: !46)
!66 = distinct !DISubprogram(name: "goodG2B", scope: !20, file: !20, line: 45, type: !21, scopeLine: 46, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DILocalVariable(name: "data", scope: !66, file: !20, line: 47, type: !4)
!68 = !DILocation(line: 47, column: 21, scope: !66)
!69 = !DILocalVariable(name: "funcPtr", scope: !66, file: !20, line: 48, type: !26)
!70 = !DILocation(line: 48, column: 12, scope: !66)
!71 = !DILocalVariable(name: "dataBadBuffer", scope: !66, file: !20, line: 49, type: !4)
!72 = !DILocation(line: 49, column: 21, scope: !66)
!73 = !DILocation(line: 49, column: 54, scope: !66)
!74 = !DILocation(line: 49, column: 37, scope: !66)
!75 = !DILocalVariable(name: "dataGoodBuffer", scope: !66, file: !20, line: 50, type: !4)
!76 = !DILocation(line: 50, column: 21, scope: !66)
!77 = !DILocation(line: 50, column: 55, scope: !66)
!78 = !DILocation(line: 50, column: 38, scope: !66)
!79 = !DILocation(line: 52, column: 12, scope: !66)
!80 = !DILocation(line: 52, column: 10, scope: !66)
!81 = !DILocation(line: 53, column: 5, scope: !66)
!82 = !DILocation(line: 53, column: 13, scope: !66)
!83 = !DILocation(line: 54, column: 1, scope: !66)

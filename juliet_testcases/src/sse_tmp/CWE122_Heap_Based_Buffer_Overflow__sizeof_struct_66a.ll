; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_66a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_66a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_66_bad() #0 !dbg !19 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataArray = alloca [5 x %struct._twoIntsStruct*], align 16
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !23, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata [5 x %struct._twoIntsStruct*]* %dataArray, metadata !25, metadata !DIExpression()), !dbg !29
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !30
  %call = call noalias align 16 i8* @malloc(i64 8) #4, !dbg !31
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !32
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !33
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !34
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %1, i32 0, i32 0, !dbg !35
  store i32 1, i32* %intOne, align 4, !dbg !36
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !37
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %2, i32 0, i32 1, !dbg !38
  store i32 2, i32* %intTwo, align 4, !dbg !39
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !40
  %arrayidx = getelementptr inbounds [5 x %struct._twoIntsStruct*], [5 x %struct._twoIntsStruct*]* %dataArray, i64 0, i64 2, !dbg !41
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %arrayidx, align 16, !dbg !42
  %arraydecay = getelementptr inbounds [5 x %struct._twoIntsStruct*], [5 x %struct._twoIntsStruct*]* %dataArray, i64 0, i64 0, !dbg !43
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_66b_badSink(%struct._twoIntsStruct** %arraydecay), !dbg !44
  ret void, !dbg !45
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_66b_badSink(%struct._twoIntsStruct**) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_66_good() #0 !dbg !46 {
entry:
  call void @goodG2B(), !dbg !47
  ret void, !dbg !48
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !49 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !55, metadata !DIExpression()), !dbg !56
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !57, metadata !DIExpression()), !dbg !58
  %call = call i64 @time(i64* null) #4, !dbg !59
  %conv = trunc i64 %call to i32, !dbg !60
  call void @srand(i32 %conv) #4, !dbg !61
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !62
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_66_good(), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !65
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_66_bad(), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !67
  ret i32 0, !dbg !68
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !69 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataArray = alloca [5 x %struct._twoIntsStruct*], align 16
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !70, metadata !DIExpression()), !dbg !71
  call void @llvm.dbg.declare(metadata [5 x %struct._twoIntsStruct*]* %dataArray, metadata !72, metadata !DIExpression()), !dbg !73
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !74
  %call = call noalias align 16 i8* @malloc(i64 8) #4, !dbg !75
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !76
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !77
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !78
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %1, i32 0, i32 0, !dbg !79
  store i32 1, i32* %intOne, align 4, !dbg !80
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !81
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %2, i32 0, i32 1, !dbg !82
  store i32 2, i32* %intTwo, align 4, !dbg !83
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !84
  %arrayidx = getelementptr inbounds [5 x %struct._twoIntsStruct*], [5 x %struct._twoIntsStruct*]* %dataArray, i64 0, i64 2, !dbg !85
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %arrayidx, align 16, !dbg !86
  %arraydecay = getelementptr inbounds [5 x %struct._twoIntsStruct*], [5 x %struct._twoIntsStruct*]* %dataArray, i64 0, i64 0, !dbg !87
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_66b_goodG2BSink(%struct._twoIntsStruct** %arraydecay), !dbg !88
  ret void, !dbg !89
}

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_66b_goodG2BSink(%struct._twoIntsStruct**) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_66a.c", directory: "/home/joelyang/SSE-Assessment")
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
!19 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_66_bad", scope: !20, file: !20, line: 24, type: !21, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!20 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_66a.c", directory: "/home/joelyang/SSE-Assessment")
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !19, file: !20, line: 26, type: !4)
!24 = !DILocation(line: 26, column: 21, scope: !19)
!25 = !DILocalVariable(name: "dataArray", scope: !19, file: !20, line: 27, type: !26)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 320, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 5)
!29 = !DILocation(line: 27, column: 21, scope: !19)
!30 = !DILocation(line: 29, column: 10, scope: !19)
!31 = !DILocation(line: 32, column: 29, scope: !19)
!32 = !DILocation(line: 32, column: 12, scope: !19)
!33 = !DILocation(line: 32, column: 10, scope: !19)
!34 = !DILocation(line: 33, column: 5, scope: !19)
!35 = !DILocation(line: 33, column: 11, scope: !19)
!36 = !DILocation(line: 33, column: 18, scope: !19)
!37 = !DILocation(line: 34, column: 5, scope: !19)
!38 = !DILocation(line: 34, column: 11, scope: !19)
!39 = !DILocation(line: 34, column: 18, scope: !19)
!40 = !DILocation(line: 36, column: 20, scope: !19)
!41 = !DILocation(line: 36, column: 5, scope: !19)
!42 = !DILocation(line: 36, column: 18, scope: !19)
!43 = !DILocation(line: 37, column: 66, scope: !19)
!44 = !DILocation(line: 37, column: 5, scope: !19)
!45 = !DILocation(line: 38, column: 1, scope: !19)
!46 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_66_good", scope: !20, file: !20, line: 61, type: !21, scopeLine: 62, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!47 = !DILocation(line: 63, column: 5, scope: !46)
!48 = !DILocation(line: 64, column: 1, scope: !46)
!49 = distinct !DISubprogram(name: "main", scope: !20, file: !20, line: 76, type: !50, scopeLine: 77, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!50 = !DISubroutineType(types: !51)
!51 = !{!10, !10, !52}
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !53, size: 64)
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !54, size: 64)
!54 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!55 = !DILocalVariable(name: "argc", arg: 1, scope: !49, file: !20, line: 76, type: !10)
!56 = !DILocation(line: 76, column: 14, scope: !49)
!57 = !DILocalVariable(name: "argv", arg: 2, scope: !49, file: !20, line: 76, type: !52)
!58 = !DILocation(line: 76, column: 27, scope: !49)
!59 = !DILocation(line: 79, column: 22, scope: !49)
!60 = !DILocation(line: 79, column: 12, scope: !49)
!61 = !DILocation(line: 79, column: 5, scope: !49)
!62 = !DILocation(line: 81, column: 5, scope: !49)
!63 = !DILocation(line: 82, column: 5, scope: !49)
!64 = !DILocation(line: 83, column: 5, scope: !49)
!65 = !DILocation(line: 86, column: 5, scope: !49)
!66 = !DILocation(line: 87, column: 5, scope: !49)
!67 = !DILocation(line: 88, column: 5, scope: !49)
!68 = !DILocation(line: 90, column: 5, scope: !49)
!69 = distinct !DISubprogram(name: "goodG2B", scope: !20, file: !20, line: 47, type: !21, scopeLine: 48, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DILocalVariable(name: "data", scope: !69, file: !20, line: 49, type: !4)
!71 = !DILocation(line: 49, column: 21, scope: !69)
!72 = !DILocalVariable(name: "dataArray", scope: !69, file: !20, line: 50, type: !26)
!73 = !DILocation(line: 50, column: 21, scope: !69)
!74 = !DILocation(line: 52, column: 10, scope: !69)
!75 = !DILocation(line: 54, column: 29, scope: !69)
!76 = !DILocation(line: 54, column: 12, scope: !69)
!77 = !DILocation(line: 54, column: 10, scope: !69)
!78 = !DILocation(line: 55, column: 5, scope: !69)
!79 = !DILocation(line: 55, column: 11, scope: !69)
!80 = !DILocation(line: 55, column: 18, scope: !69)
!81 = !DILocation(line: 56, column: 5, scope: !69)
!82 = !DILocation(line: 56, column: 11, scope: !69)
!83 = !DILocation(line: 56, column: 18, scope: !69)
!84 = !DILocation(line: 57, column: 20, scope: !69)
!85 = !DILocation(line: 57, column: 5, scope: !69)
!86 = !DILocation(line: 57, column: 18, scope: !69)
!87 = !DILocation(line: 58, column: 70, scope: !69)
!88 = !DILocation(line: 58, column: 5, scope: !69)
!89 = !DILocation(line: 59, column: 1, scope: !69)

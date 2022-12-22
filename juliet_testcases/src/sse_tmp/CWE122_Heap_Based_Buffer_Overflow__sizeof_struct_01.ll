; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_01.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_01.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_01_bad() #0 !dbg !20 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !24, metadata !DIExpression()), !dbg !25
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !26
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !27
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !28
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !29
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !30
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !32
  br i1 %cmp, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !34
  unreachable, !dbg !34

if.end:                                           ; preds = %entry
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !36
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %2, i32 0, i32 0, !dbg !37
  store i32 1, i32* %intOne, align 4, !dbg !38
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !39
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %3, i32 0, i32 1, !dbg !40
  store i32 2, i32* %intTwo, align 4, !dbg !41
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !42
  call void @printStructLine(%struct._twoIntsStruct* %4), !dbg !43
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !44
  %6 = bitcast %struct._twoIntsStruct* %5 to i8*, !dbg !44
  call void @free(i8* %6) #5, !dbg !45
  ret void, !dbg !46
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_01_good() #0 !dbg !47 {
entry:
  call void @goodG2B(), !dbg !48
  ret void, !dbg !49
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !50 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !56, metadata !DIExpression()), !dbg !57
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !58, metadata !DIExpression()), !dbg !59
  %call = call i64 @time(i64* null) #5, !dbg !60
  %conv = trunc i64 %call to i32, !dbg !61
  call void @srand(i32 %conv) #5, !dbg !62
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !63
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_01_good(), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !66
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_01_bad(), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !68
  ret i32 0, !dbg !69
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !70 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !71, metadata !DIExpression()), !dbg !72
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !73
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !74
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !75
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !76
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !77
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !79
  br i1 %cmp, label %if.then, label %if.end, !dbg !80

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !81
  unreachable, !dbg !81

if.end:                                           ; preds = %entry
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !83
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %2, i32 0, i32 0, !dbg !84
  store i32 1, i32* %intOne, align 4, !dbg !85
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !86
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %3, i32 0, i32 1, !dbg !87
  store i32 2, i32* %intTwo, align 4, !dbg !88
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !89
  call void @printStructLine(%struct._twoIntsStruct* %4), !dbg !90
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !91
  %6 = bitcast %struct._twoIntsStruct* %5 to i8*, !dbg !91
  call void @free(i8* %6) #5, !dbg !92
  ret void, !dbg !93
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_01.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !12, !13}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !6, line: 100, baseType: !7)
!6 = !DIFile(filename: "./testcasesupport/std_testcase.h", directory: "/root/SSE-Assessment")
!7 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !6, line: 96, size: 64, elements: !8)
!8 = !{!9, !11}
!9 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !7, file: !6, line: 98, baseType: !10, size: 32)
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !7, file: !6, line: 99, baseType: !10, size: 32, offset: 32)
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!13 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_01_bad", scope: !21, file: !21, line: 21, type: !22, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!21 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_01.c", directory: "/root/SSE-Assessment")
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !20, file: !21, line: 23, type: !4)
!25 = !DILocation(line: 23, column: 21, scope: !20)
!26 = !DILocation(line: 25, column: 10, scope: !20)
!27 = !DILocation(line: 28, column: 29, scope: !20)
!28 = !DILocation(line: 28, column: 12, scope: !20)
!29 = !DILocation(line: 28, column: 10, scope: !20)
!30 = !DILocation(line: 29, column: 9, scope: !31)
!31 = distinct !DILexicalBlock(scope: !20, file: !21, line: 29, column: 9)
!32 = !DILocation(line: 29, column: 14, scope: !31)
!33 = !DILocation(line: 29, column: 9, scope: !20)
!34 = !DILocation(line: 29, column: 24, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !21, line: 29, column: 23)
!36 = !DILocation(line: 30, column: 5, scope: !20)
!37 = !DILocation(line: 30, column: 11, scope: !20)
!38 = !DILocation(line: 30, column: 18, scope: !20)
!39 = !DILocation(line: 31, column: 5, scope: !20)
!40 = !DILocation(line: 31, column: 11, scope: !20)
!41 = !DILocation(line: 31, column: 18, scope: !20)
!42 = !DILocation(line: 33, column: 21, scope: !20)
!43 = !DILocation(line: 33, column: 5, scope: !20)
!44 = !DILocation(line: 34, column: 10, scope: !20)
!45 = !DILocation(line: 34, column: 5, scope: !20)
!46 = !DILocation(line: 35, column: 1, scope: !20)
!47 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_01_good", scope: !21, file: !21, line: 57, type: !22, scopeLine: 58, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!48 = !DILocation(line: 59, column: 5, scope: !47)
!49 = !DILocation(line: 60, column: 1, scope: !47)
!50 = distinct !DISubprogram(name: "main", scope: !21, file: !21, line: 72, type: !51, scopeLine: 73, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!51 = !DISubroutineType(types: !52)
!52 = !{!10, !10, !53}
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !54, size: 64)
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !55, size: 64)
!55 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!56 = !DILocalVariable(name: "argc", arg: 1, scope: !50, file: !21, line: 72, type: !10)
!57 = !DILocation(line: 72, column: 14, scope: !50)
!58 = !DILocalVariable(name: "argv", arg: 2, scope: !50, file: !21, line: 72, type: !53)
!59 = !DILocation(line: 72, column: 27, scope: !50)
!60 = !DILocation(line: 75, column: 22, scope: !50)
!61 = !DILocation(line: 75, column: 12, scope: !50)
!62 = !DILocation(line: 75, column: 5, scope: !50)
!63 = !DILocation(line: 77, column: 5, scope: !50)
!64 = !DILocation(line: 78, column: 5, scope: !50)
!65 = !DILocation(line: 79, column: 5, scope: !50)
!66 = !DILocation(line: 82, column: 5, scope: !50)
!67 = !DILocation(line: 83, column: 5, scope: !50)
!68 = !DILocation(line: 84, column: 5, scope: !50)
!69 = !DILocation(line: 86, column: 5, scope: !50)
!70 = distinct !DISubprogram(name: "goodG2B", scope: !21, file: !21, line: 42, type: !22, scopeLine: 43, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DILocalVariable(name: "data", scope: !70, file: !21, line: 44, type: !4)
!72 = !DILocation(line: 44, column: 21, scope: !70)
!73 = !DILocation(line: 46, column: 10, scope: !70)
!74 = !DILocation(line: 48, column: 29, scope: !70)
!75 = !DILocation(line: 48, column: 12, scope: !70)
!76 = !DILocation(line: 48, column: 10, scope: !70)
!77 = !DILocation(line: 49, column: 9, scope: !78)
!78 = distinct !DILexicalBlock(scope: !70, file: !21, line: 49, column: 9)
!79 = !DILocation(line: 49, column: 14, scope: !78)
!80 = !DILocation(line: 49, column: 9, scope: !70)
!81 = !DILocation(line: 49, column: 24, scope: !82)
!82 = distinct !DILexicalBlock(scope: !78, file: !21, line: 49, column: 23)
!83 = !DILocation(line: 50, column: 5, scope: !70)
!84 = !DILocation(line: 50, column: 11, scope: !70)
!85 = !DILocation(line: 50, column: 18, scope: !70)
!86 = !DILocation(line: 51, column: 5, scope: !70)
!87 = !DILocation(line: 51, column: 11, scope: !70)
!88 = !DILocation(line: 51, column: 18, scope: !70)
!89 = !DILocation(line: 53, column: 21, scope: !70)
!90 = !DILocation(line: 53, column: 5, scope: !70)
!91 = !DILocation(line: 54, column: 10, scope: !70)
!92 = !DILocation(line: 54, column: 5, scope: !70)
!93 = !DILocation(line: 55, column: 1, scope: !70)

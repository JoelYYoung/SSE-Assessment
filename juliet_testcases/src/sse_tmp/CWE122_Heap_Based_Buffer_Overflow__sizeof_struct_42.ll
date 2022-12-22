; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_42.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_42.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_42_bad() #0 !dbg !20 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !24, metadata !DIExpression()), !dbg !25
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !26
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !27
  %call = call %struct._twoIntsStruct* @badSource(%struct._twoIntsStruct* %0), !dbg !28
  store %struct._twoIntsStruct* %call, %struct._twoIntsStruct** %data, align 8, !dbg !29
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !30
  call void @printStructLine(%struct._twoIntsStruct* %1), !dbg !31
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !32
  %3 = bitcast %struct._twoIntsStruct* %2 to i8*, !dbg !32
  call void @free(i8* %3) #5, !dbg !33
  ret void, !dbg !34
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal %struct._twoIntsStruct* @badSource(%struct._twoIntsStruct* %data) #0 !dbg !35 {
entry:
  %data.addr = alloca %struct._twoIntsStruct*, align 8
  store %struct._twoIntsStruct* %data, %struct._twoIntsStruct** %data.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data.addr, metadata !38, metadata !DIExpression()), !dbg !39
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !40
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !41
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data.addr, align 8, !dbg !42
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !43
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !45
  br i1 %cmp, label %if.then, label %if.end, !dbg !46

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !47
  unreachable, !dbg !47

if.end:                                           ; preds = %entry
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !49
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %2, i32 0, i32 0, !dbg !50
  store i32 1, i32* %intOne, align 4, !dbg !51
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !52
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %3, i32 0, i32 1, !dbg !53
  store i32 2, i32* %intTwo, align 4, !dbg !54
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !55
  ret %struct._twoIntsStruct* %4, !dbg !56
}

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_42_good() #0 !dbg !57 {
entry:
  call void @goodG2B(), !dbg !58
  ret void, !dbg !59
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !60 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !66, metadata !DIExpression()), !dbg !67
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !68, metadata !DIExpression()), !dbg !69
  %call = call i64 @time(i64* null) #5, !dbg !70
  %conv = trunc i64 %call to i32, !dbg !71
  call void @srand(i32 %conv) #5, !dbg !72
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !73
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_42_good(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !76
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_42_bad(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !78
  ret i32 0, !dbg !79
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !80 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !81, metadata !DIExpression()), !dbg !82
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !83
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !84
  %call = call %struct._twoIntsStruct* @goodG2BSource(%struct._twoIntsStruct* %0), !dbg !85
  store %struct._twoIntsStruct* %call, %struct._twoIntsStruct** %data, align 8, !dbg !86
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !87
  call void @printStructLine(%struct._twoIntsStruct* %1), !dbg !88
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !89
  %3 = bitcast %struct._twoIntsStruct* %2 to i8*, !dbg !89
  call void @free(i8* %3) #5, !dbg !90
  ret void, !dbg !91
}

; Function Attrs: noinline nounwind uwtable
define internal %struct._twoIntsStruct* @goodG2BSource(%struct._twoIntsStruct* %data) #0 !dbg !92 {
entry:
  %data.addr = alloca %struct._twoIntsStruct*, align 8
  store %struct._twoIntsStruct* %data, %struct._twoIntsStruct** %data.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data.addr, metadata !93, metadata !DIExpression()), !dbg !94
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !95
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !96
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data.addr, align 8, !dbg !97
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !98
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !100
  br i1 %cmp, label %if.then, label %if.end, !dbg !101

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !102
  unreachable, !dbg !102

if.end:                                           ; preds = %entry
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !104
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %2, i32 0, i32 0, !dbg !105
  store i32 1, i32* %intOne, align 4, !dbg !106
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !107
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %3, i32 0, i32 1, !dbg !108
  store i32 2, i32* %intTwo, align 4, !dbg !109
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !110
  ret %struct._twoIntsStruct* %4, !dbg !111
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_42.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !5, !13}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !7, line: 100, baseType: !8)
!7 = !DIFile(filename: "./testcasesupport/std_testcase.h", directory: "/root/SSE-Assessment")
!8 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !7, line: 96, size: 64, elements: !9)
!9 = !{!10, !12}
!10 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !8, file: !7, line: 98, baseType: !11, size: 32)
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !8, file: !7, line: 99, baseType: !11, size: 32, offset: 32)
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_42_bad", scope: !21, file: !21, line: 32, type: !22, scopeLine: 33, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!21 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_42.c", directory: "/root/SSE-Assessment")
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !20, file: !21, line: 34, type: !5)
!25 = !DILocation(line: 34, column: 21, scope: !20)
!26 = !DILocation(line: 36, column: 10, scope: !20)
!27 = !DILocation(line: 37, column: 22, scope: !20)
!28 = !DILocation(line: 37, column: 12, scope: !20)
!29 = !DILocation(line: 37, column: 10, scope: !20)
!30 = !DILocation(line: 39, column: 21, scope: !20)
!31 = !DILocation(line: 39, column: 5, scope: !20)
!32 = !DILocation(line: 40, column: 10, scope: !20)
!33 = !DILocation(line: 40, column: 5, scope: !20)
!34 = !DILocation(line: 41, column: 1, scope: !20)
!35 = distinct !DISubprogram(name: "badSource", scope: !21, file: !21, line: 21, type: !36, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!36 = !DISubroutineType(types: !37)
!37 = !{!5, !5}
!38 = !DILocalVariable(name: "data", arg: 1, scope: !35, file: !21, line: 21, type: !5)
!39 = !DILocation(line: 21, column: 50, scope: !35)
!40 = !DILocation(line: 25, column: 29, scope: !35)
!41 = !DILocation(line: 25, column: 12, scope: !35)
!42 = !DILocation(line: 25, column: 10, scope: !35)
!43 = !DILocation(line: 26, column: 9, scope: !44)
!44 = distinct !DILexicalBlock(scope: !35, file: !21, line: 26, column: 9)
!45 = !DILocation(line: 26, column: 14, scope: !44)
!46 = !DILocation(line: 26, column: 9, scope: !35)
!47 = !DILocation(line: 26, column: 24, scope: !48)
!48 = distinct !DILexicalBlock(scope: !44, file: !21, line: 26, column: 23)
!49 = !DILocation(line: 27, column: 5, scope: !35)
!50 = !DILocation(line: 27, column: 11, scope: !35)
!51 = !DILocation(line: 27, column: 18, scope: !35)
!52 = !DILocation(line: 28, column: 5, scope: !35)
!53 = !DILocation(line: 28, column: 11, scope: !35)
!54 = !DILocation(line: 28, column: 18, scope: !35)
!55 = !DILocation(line: 29, column: 12, scope: !35)
!56 = !DILocation(line: 29, column: 5, scope: !35)
!57 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_42_good", scope: !21, file: !21, line: 69, type: !22, scopeLine: 70, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DILocation(line: 71, column: 5, scope: !57)
!59 = !DILocation(line: 72, column: 1, scope: !57)
!60 = distinct !DISubprogram(name: "main", scope: !21, file: !21, line: 84, type: !61, scopeLine: 85, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DISubroutineType(types: !62)
!62 = !{!11, !11, !63}
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!66 = !DILocalVariable(name: "argc", arg: 1, scope: !60, file: !21, line: 84, type: !11)
!67 = !DILocation(line: 84, column: 14, scope: !60)
!68 = !DILocalVariable(name: "argv", arg: 2, scope: !60, file: !21, line: 84, type: !63)
!69 = !DILocation(line: 84, column: 27, scope: !60)
!70 = !DILocation(line: 87, column: 22, scope: !60)
!71 = !DILocation(line: 87, column: 12, scope: !60)
!72 = !DILocation(line: 87, column: 5, scope: !60)
!73 = !DILocation(line: 89, column: 5, scope: !60)
!74 = !DILocation(line: 90, column: 5, scope: !60)
!75 = !DILocation(line: 91, column: 5, scope: !60)
!76 = !DILocation(line: 94, column: 5, scope: !60)
!77 = !DILocation(line: 95, column: 5, scope: !60)
!78 = !DILocation(line: 96, column: 5, scope: !60)
!79 = !DILocation(line: 98, column: 5, scope: !60)
!80 = distinct !DISubprogram(name: "goodG2B", scope: !21, file: !21, line: 58, type: !22, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DILocalVariable(name: "data", scope: !80, file: !21, line: 60, type: !5)
!82 = !DILocation(line: 60, column: 21, scope: !80)
!83 = !DILocation(line: 62, column: 10, scope: !80)
!84 = !DILocation(line: 63, column: 26, scope: !80)
!85 = !DILocation(line: 63, column: 12, scope: !80)
!86 = !DILocation(line: 63, column: 10, scope: !80)
!87 = !DILocation(line: 65, column: 21, scope: !80)
!88 = !DILocation(line: 65, column: 5, scope: !80)
!89 = !DILocation(line: 66, column: 10, scope: !80)
!90 = !DILocation(line: 66, column: 5, scope: !80)
!91 = !DILocation(line: 67, column: 1, scope: !80)
!92 = distinct !DISubprogram(name: "goodG2BSource", scope: !21, file: !21, line: 47, type: !36, scopeLine: 48, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!93 = !DILocalVariable(name: "data", arg: 1, scope: !92, file: !21, line: 47, type: !5)
!94 = !DILocation(line: 47, column: 54, scope: !92)
!95 = !DILocation(line: 50, column: 29, scope: !92)
!96 = !DILocation(line: 50, column: 12, scope: !92)
!97 = !DILocation(line: 50, column: 10, scope: !92)
!98 = !DILocation(line: 51, column: 9, scope: !99)
!99 = distinct !DILexicalBlock(scope: !92, file: !21, line: 51, column: 9)
!100 = !DILocation(line: 51, column: 14, scope: !99)
!101 = !DILocation(line: 51, column: 9, scope: !92)
!102 = !DILocation(line: 51, column: 24, scope: !103)
!103 = distinct !DILexicalBlock(scope: !99, file: !21, line: 51, column: 23)
!104 = !DILocation(line: 52, column: 5, scope: !92)
!105 = !DILocation(line: 52, column: 11, scope: !92)
!106 = !DILocation(line: 52, column: 18, scope: !92)
!107 = !DILocation(line: 53, column: 5, scope: !92)
!108 = !DILocation(line: 53, column: 11, scope: !92)
!109 = !DILocation(line: 53, column: 18, scope: !92)
!110 = !DILocation(line: 54, column: 12, scope: !92)
!111 = !DILocation(line: 54, column: 5, scope: !92)

; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memmove_14.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memmove_14.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._charVoid = type { [16 x i8], i8*, i8* }

@globalFive = external dso_local global i32, align 4
@.str = private unnamed_addr constant [32 x i8] c"0123456789abcdef0123456789abcde\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memmove_14_bad() #0 !dbg !14 {
entry:
  %structCharVoid = alloca %struct._charVoid, align 8
  %0 = load i32, i32* @globalFive, align 4, !dbg !18
  %cmp = icmp eq i32 %0, 5, !dbg !20
  br i1 %cmp, label %if.then, label %if.end, !dbg !21

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid* %structCharVoid, metadata !22, metadata !DIExpression()), !dbg !34
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !35
  store i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i8** %voidSecond, align 8, !dbg !36
  %voidSecond1 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !37
  %1 = load i8*, i8** %voidSecond1, align 8, !dbg !37
  call void @printLine(i8* %1), !dbg !38
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !39
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst, i64 0, i64 0, !dbg !40
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %arraydecay, i8* align 1 getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i64 32, i1 false), !dbg !40
  %charFirst2 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !41
  %arrayidx = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst2, i64 0, i64 15, !dbg !42
  store i8 0, i8* %arrayidx, align 1, !dbg !43
  %charFirst3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !44
  %arraydecay4 = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst3, i64 0, i64 0, !dbg !45
  call void @printLine(i8* %arraydecay4), !dbg !46
  %voidSecond5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !47
  %2 = load i8*, i8** %voidSecond5, align 8, !dbg !47
  call void @printLine(i8* %2), !dbg !48
  br label %if.end, !dbg !49

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !50
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @printLine(i8*) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memmove_14_good() #0 !dbg !51 {
entry:
  call void @good1(), !dbg !52
  call void @good2(), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !55 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !60, metadata !DIExpression()), !dbg !61
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !62, metadata !DIExpression()), !dbg !63
  %call = call i64 @time(i64* null) #5, !dbg !64
  %conv = trunc i64 %call to i32, !dbg !65
  call void @srand(i32 %conv) #5, !dbg !66
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !67
  call void @CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memmove_14_good(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !70
  call void @CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memmove_14_bad(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !72
  ret i32 0, !dbg !73
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !74 {
entry:
  %structCharVoid = alloca %struct._charVoid, align 8
  %0 = load i32, i32* @globalFive, align 4, !dbg !75
  %cmp = icmp ne i32 %0, 5, !dbg !77
  br i1 %cmp, label %if.then, label %if.else, !dbg !78

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !79
  br label %if.end, !dbg !81

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid* %structCharVoid, metadata !82, metadata !DIExpression()), !dbg !85
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !86
  store i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i8** %voidSecond, align 8, !dbg !87
  %voidSecond1 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !88
  %1 = load i8*, i8** %voidSecond1, align 8, !dbg !88
  call void @printLine(i8* %1), !dbg !89
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !90
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst, i64 0, i64 0, !dbg !91
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %arraydecay, i8* align 1 getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i64 16, i1 false), !dbg !91
  %charFirst2 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !92
  %arrayidx = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst2, i64 0, i64 15, !dbg !93
  store i8 0, i8* %arrayidx, align 1, !dbg !94
  %charFirst3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !95
  %arraydecay4 = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst3, i64 0, i64 0, !dbg !96
  call void @printLine(i8* %arraydecay4), !dbg !97
  %voidSecond5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !98
  %2 = load i8*, i8** %voidSecond5, align 8, !dbg !98
  call void @printLine(i8* %2), !dbg !99
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !100
}

; Function Attrs: noinline nounwind uwtable
define internal void @good2() #0 !dbg !101 {
entry:
  %structCharVoid = alloca %struct._charVoid, align 8
  %0 = load i32, i32* @globalFive, align 4, !dbg !102
  %cmp = icmp eq i32 %0, 5, !dbg !104
  br i1 %cmp, label %if.then, label %if.end, !dbg !105

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid* %structCharVoid, metadata !106, metadata !DIExpression()), !dbg !109
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !110
  store i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i8** %voidSecond, align 8, !dbg !111
  %voidSecond1 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !112
  %1 = load i8*, i8** %voidSecond1, align 8, !dbg !112
  call void @printLine(i8* %1), !dbg !113
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !114
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst, i64 0, i64 0, !dbg !115
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %arraydecay, i8* align 1 getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i64 16, i1 false), !dbg !115
  %charFirst2 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !116
  %arrayidx = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst2, i64 0, i64 15, !dbg !117
  store i8 0, i8* %arrayidx, align 1, !dbg !118
  %charFirst3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !119
  %arraydecay4 = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst3, i64 0, i64 0, !dbg !120
  call void @printLine(i8* %arraydecay4), !dbg !121
  %voidSecond5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !122
  %2 = load i8*, i8** %voidSecond5, align 8, !dbg !122
  call void @printLine(i8* %2), !dbg !123
  br label %if.end, !dbg !124

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !125
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memmove_14.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !5, !7}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 13.0.0"}
!14 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memmove_14_bad", scope: !15, file: !15, line: 34, type: !16, scopeLine: 35, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memmove_14.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocation(line: 36, column: 8, scope: !19)
!19 = distinct !DILexicalBlock(scope: !14, file: !15, line: 36, column: 8)
!20 = !DILocation(line: 36, column: 18, scope: !19)
!21 = !DILocation(line: 36, column: 8, scope: !14)
!22 = !DILocalVariable(name: "structCharVoid", scope: !23, file: !15, line: 39, type: !25)
!23 = distinct !DILexicalBlock(scope: !24, file: !15, line: 38, column: 9)
!24 = distinct !DILexicalBlock(scope: !19, file: !15, line: 37, column: 5)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "charVoid", file: !15, line: 30, baseType: !26)
!26 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_charVoid", file: !15, line: 25, size: 256, elements: !27)
!27 = !{!28, !32, !33}
!28 = !DIDerivedType(tag: DW_TAG_member, name: "charFirst", scope: !26, file: !15, line: 27, baseType: !29, size: 128)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 128, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 16)
!32 = !DIDerivedType(tag: DW_TAG_member, name: "voidSecond", scope: !26, file: !15, line: 28, baseType: !4, size: 64, offset: 128)
!33 = !DIDerivedType(tag: DW_TAG_member, name: "voidThird", scope: !26, file: !15, line: 29, baseType: !4, size: 64, offset: 192)
!34 = !DILocation(line: 39, column: 22, scope: !23)
!35 = !DILocation(line: 40, column: 28, scope: !23)
!36 = !DILocation(line: 40, column: 39, scope: !23)
!37 = !DILocation(line: 42, column: 46, scope: !23)
!38 = !DILocation(line: 42, column: 13, scope: !23)
!39 = !DILocation(line: 44, column: 36, scope: !23)
!40 = !DILocation(line: 44, column: 13, scope: !23)
!41 = !DILocation(line: 45, column: 28, scope: !23)
!42 = !DILocation(line: 45, column: 13, scope: !23)
!43 = !DILocation(line: 45, column: 89, scope: !23)
!44 = !DILocation(line: 46, column: 46, scope: !23)
!45 = !DILocation(line: 46, column: 31, scope: !23)
!46 = !DILocation(line: 46, column: 13, scope: !23)
!47 = !DILocation(line: 47, column: 46, scope: !23)
!48 = !DILocation(line: 47, column: 13, scope: !23)
!49 = !DILocation(line: 49, column: 5, scope: !24)
!50 = !DILocation(line: 50, column: 1, scope: !14)
!51 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memmove_14_good", scope: !15, file: !15, line: 99, type: !16, scopeLine: 100, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!52 = !DILocation(line: 101, column: 5, scope: !51)
!53 = !DILocation(line: 102, column: 5, scope: !51)
!54 = !DILocation(line: 103, column: 1, scope: !51)
!55 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 114, type: !56, scopeLine: 115, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DISubroutineType(types: !57)
!57 = !{!58, !58, !59}
!58 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!60 = !DILocalVariable(name: "argc", arg: 1, scope: !55, file: !15, line: 114, type: !58)
!61 = !DILocation(line: 114, column: 14, scope: !55)
!62 = !DILocalVariable(name: "argv", arg: 2, scope: !55, file: !15, line: 114, type: !59)
!63 = !DILocation(line: 114, column: 27, scope: !55)
!64 = !DILocation(line: 117, column: 22, scope: !55)
!65 = !DILocation(line: 117, column: 12, scope: !55)
!66 = !DILocation(line: 117, column: 5, scope: !55)
!67 = !DILocation(line: 119, column: 5, scope: !55)
!68 = !DILocation(line: 120, column: 5, scope: !55)
!69 = !DILocation(line: 121, column: 5, scope: !55)
!70 = !DILocation(line: 124, column: 5, scope: !55)
!71 = !DILocation(line: 125, column: 5, scope: !55)
!72 = !DILocation(line: 126, column: 5, scope: !55)
!73 = !DILocation(line: 128, column: 5, scope: !55)
!74 = distinct !DISubprogram(name: "good1", scope: !15, file: !15, line: 57, type: !16, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DILocation(line: 59, column: 8, scope: !76)
!76 = distinct !DILexicalBlock(scope: !74, file: !15, line: 59, column: 8)
!77 = !DILocation(line: 59, column: 18, scope: !76)
!78 = !DILocation(line: 59, column: 8, scope: !74)
!79 = !DILocation(line: 62, column: 9, scope: !80)
!80 = distinct !DILexicalBlock(scope: !76, file: !15, line: 60, column: 5)
!81 = !DILocation(line: 63, column: 5, scope: !80)
!82 = !DILocalVariable(name: "structCharVoid", scope: !83, file: !15, line: 67, type: !25)
!83 = distinct !DILexicalBlock(scope: !84, file: !15, line: 66, column: 9)
!84 = distinct !DILexicalBlock(scope: !76, file: !15, line: 65, column: 5)
!85 = !DILocation(line: 67, column: 22, scope: !83)
!86 = !DILocation(line: 68, column: 28, scope: !83)
!87 = !DILocation(line: 68, column: 39, scope: !83)
!88 = !DILocation(line: 70, column: 46, scope: !83)
!89 = !DILocation(line: 70, column: 13, scope: !83)
!90 = !DILocation(line: 72, column: 36, scope: !83)
!91 = !DILocation(line: 72, column: 13, scope: !83)
!92 = !DILocation(line: 73, column: 28, scope: !83)
!93 = !DILocation(line: 73, column: 13, scope: !83)
!94 = !DILocation(line: 73, column: 89, scope: !83)
!95 = !DILocation(line: 74, column: 46, scope: !83)
!96 = !DILocation(line: 74, column: 31, scope: !83)
!97 = !DILocation(line: 74, column: 13, scope: !83)
!98 = !DILocation(line: 75, column: 46, scope: !83)
!99 = !DILocation(line: 75, column: 13, scope: !83)
!100 = !DILocation(line: 78, column: 1, scope: !74)
!101 = distinct !DISubprogram(name: "good2", scope: !15, file: !15, line: 81, type: !16, scopeLine: 82, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!102 = !DILocation(line: 83, column: 8, scope: !103)
!103 = distinct !DILexicalBlock(scope: !101, file: !15, line: 83, column: 8)
!104 = !DILocation(line: 83, column: 18, scope: !103)
!105 = !DILocation(line: 83, column: 8, scope: !101)
!106 = !DILocalVariable(name: "structCharVoid", scope: !107, file: !15, line: 86, type: !25)
!107 = distinct !DILexicalBlock(scope: !108, file: !15, line: 85, column: 9)
!108 = distinct !DILexicalBlock(scope: !103, file: !15, line: 84, column: 5)
!109 = !DILocation(line: 86, column: 22, scope: !107)
!110 = !DILocation(line: 87, column: 28, scope: !107)
!111 = !DILocation(line: 87, column: 39, scope: !107)
!112 = !DILocation(line: 89, column: 46, scope: !107)
!113 = !DILocation(line: 89, column: 13, scope: !107)
!114 = !DILocation(line: 91, column: 36, scope: !107)
!115 = !DILocation(line: 91, column: 13, scope: !107)
!116 = !DILocation(line: 92, column: 28, scope: !107)
!117 = !DILocation(line: 92, column: 13, scope: !107)
!118 = !DILocation(line: 92, column: 89, scope: !107)
!119 = !DILocation(line: 93, column: 46, scope: !107)
!120 = !DILocation(line: 93, column: 31, scope: !107)
!121 = !DILocation(line: 93, column: 13, scope: !107)
!122 = !DILocation(line: 94, column: 46, scope: !107)
!123 = !DILocation(line: 94, column: 13, scope: !107)
!124 = !DILocation(line: 96, column: 5, scope: !108)
!125 = !DILocation(line: 97, column: 1, scope: !101)

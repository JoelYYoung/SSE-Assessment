; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncpy_09.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncpy_09.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@GLOBAL_CONST_TRUE = external dso_local constant i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@GLOBAL_CONST_FALSE = external dso_local constant i32, align 4
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncpy_09_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = alloca i8, i64 100, align 16, !dbg !21
  store i8* %0, i8** %dataBuffer, align 8, !dbg !20
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !22
  store i8* %1, i8** %data, align 8, !dbg !23
  %2 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !24
  %tobool = icmp ne i32 %2, 0, !dbg !24
  br i1 %tobool, label %if.then, label %if.end, !dbg !26

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %data, align 8, !dbg !27
  call void @llvm.memset.p0i8.i64(i8* align 1 %3, i8 65, i64 99, i1 false), !dbg !29
  %4 = load i8*, i8** %data, align 8, !dbg !30
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 99, !dbg !30
  store i8 0, i8* %arrayidx, align 1, !dbg !31
  br label %if.end, !dbg !32

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !33, metadata !DIExpression()), !dbg !38
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !38
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !38
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !39
  %6 = load i8*, i8** %data, align 8, !dbg !40
  %7 = load i8*, i8** %data, align 8, !dbg !41
  %call = call i64 @strlen(i8* %7) #6, !dbg !42
  %call1 = call i8* @strncpy(i8* %arraydecay, i8* %6, i64 %call) #7, !dbg !43
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !44
  store i8 0, i8* %arrayidx2, align 1, !dbg !45
  %8 = load i8*, i8** %data, align 8, !dbg !46
  call void @printLine(i8* %8), !dbg !47
  ret void, !dbg !48
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8*, i8*, i64) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #4

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncpy_09_good() #0 !dbg !49 {
entry:
  call void @goodG2B1(), !dbg !50
  call void @goodG2B2(), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !53 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !58, metadata !DIExpression()), !dbg !59
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !60, metadata !DIExpression()), !dbg !61
  %call = call i64 @time(i64* null) #7, !dbg !62
  %conv = trunc i64 %call to i32, !dbg !63
  call void @srand(i32 %conv) #7, !dbg !64
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !65
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncpy_09_good(), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !68
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncpy_09_bad(), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !70
  ret i32 0, !dbg !71
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !72 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !73, metadata !DIExpression()), !dbg !74
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !75, metadata !DIExpression()), !dbg !76
  %0 = alloca i8, i64 100, align 16, !dbg !77
  store i8* %0, i8** %dataBuffer, align 8, !dbg !76
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !78
  store i8* %1, i8** %data, align 8, !dbg !79
  %2 = load i32, i32* @GLOBAL_CONST_FALSE, align 4, !dbg !80
  %tobool = icmp ne i32 %2, 0, !dbg !80
  br i1 %tobool, label %if.then, label %if.else, !dbg !82

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !83
  br label %if.end, !dbg !85

if.else:                                          ; preds = %entry
  %3 = load i8*, i8** %data, align 8, !dbg !86
  call void @llvm.memset.p0i8.i64(i8* align 1 %3, i8 65, i64 49, i1 false), !dbg !88
  %4 = load i8*, i8** %data, align 8, !dbg !89
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 49, !dbg !89
  store i8 0, i8* %arrayidx, align 1, !dbg !90
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !91, metadata !DIExpression()), !dbg !93
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !93
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !93
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !94
  %6 = load i8*, i8** %data, align 8, !dbg !95
  %7 = load i8*, i8** %data, align 8, !dbg !96
  %call = call i64 @strlen(i8* %7) #6, !dbg !97
  %call1 = call i8* @strncpy(i8* %arraydecay, i8* %6, i64 %call) #7, !dbg !98
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !99
  store i8 0, i8* %arrayidx2, align 1, !dbg !100
  %8 = load i8*, i8** %data, align 8, !dbg !101
  call void @printLine(i8* %8), !dbg !102
  ret void, !dbg !103
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !104 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !105, metadata !DIExpression()), !dbg !106
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !107, metadata !DIExpression()), !dbg !108
  %0 = alloca i8, i64 100, align 16, !dbg !109
  store i8* %0, i8** %dataBuffer, align 8, !dbg !108
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !110
  store i8* %1, i8** %data, align 8, !dbg !111
  %2 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !112
  %tobool = icmp ne i32 %2, 0, !dbg !112
  br i1 %tobool, label %if.then, label %if.end, !dbg !114

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %data, align 8, !dbg !115
  call void @llvm.memset.p0i8.i64(i8* align 1 %3, i8 65, i64 49, i1 false), !dbg !117
  %4 = load i8*, i8** %data, align 8, !dbg !118
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 49, !dbg !118
  store i8 0, i8* %arrayidx, align 1, !dbg !119
  br label %if.end, !dbg !120

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !121, metadata !DIExpression()), !dbg !123
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !123
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !123
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !124
  %6 = load i8*, i8** %data, align 8, !dbg !125
  %7 = load i8*, i8** %data, align 8, !dbg !126
  %call = call i64 @strlen(i8* %7) #6, !dbg !127
  %call1 = call i8* @strncpy(i8* %arraydecay, i8* %6, i64 %call) #7, !dbg !128
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !129
  store i8 0, i8* %arrayidx2, align 1, !dbg !130
  %8 = load i8*, i8** %data, align 8, !dbg !131
  call void @printLine(i8* %8), !dbg !132
  ret void, !dbg !133
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncpy_09.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncpy_09_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncpy_09.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 25, type: !4)
!18 = !DILocation(line: 25, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataBuffer", scope: !13, file: !14, line: 26, type: !4)
!20 = !DILocation(line: 26, column: 12, scope: !13)
!21 = !DILocation(line: 26, column: 33, scope: !13)
!22 = !DILocation(line: 27, column: 12, scope: !13)
!23 = !DILocation(line: 27, column: 10, scope: !13)
!24 = !DILocation(line: 28, column: 8, scope: !25)
!25 = distinct !DILexicalBlock(scope: !13, file: !14, line: 28, column: 8)
!26 = !DILocation(line: 28, column: 8, scope: !13)
!27 = !DILocation(line: 31, column: 16, scope: !28)
!28 = distinct !DILexicalBlock(scope: !25, file: !14, line: 29, column: 5)
!29 = !DILocation(line: 31, column: 9, scope: !28)
!30 = !DILocation(line: 32, column: 9, scope: !28)
!31 = !DILocation(line: 32, column: 21, scope: !28)
!32 = !DILocation(line: 33, column: 5, scope: !28)
!33 = !DILocalVariable(name: "dest", scope: !34, file: !14, line: 35, type: !35)
!34 = distinct !DILexicalBlock(scope: !13, file: !14, line: 34, column: 5)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 50)
!38 = !DILocation(line: 35, column: 14, scope: !34)
!39 = !DILocation(line: 37, column: 17, scope: !34)
!40 = !DILocation(line: 37, column: 23, scope: !34)
!41 = !DILocation(line: 37, column: 36, scope: !34)
!42 = !DILocation(line: 37, column: 29, scope: !34)
!43 = !DILocation(line: 37, column: 9, scope: !34)
!44 = !DILocation(line: 38, column: 9, scope: !34)
!45 = !DILocation(line: 38, column: 20, scope: !34)
!46 = !DILocation(line: 39, column: 19, scope: !34)
!47 = !DILocation(line: 39, column: 9, scope: !34)
!48 = !DILocation(line: 41, column: 1, scope: !13)
!49 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncpy_09_good", scope: !14, file: !14, line: 94, type: !15, scopeLine: 95, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!50 = !DILocation(line: 96, column: 5, scope: !49)
!51 = !DILocation(line: 97, column: 5, scope: !49)
!52 = !DILocation(line: 98, column: 1, scope: !49)
!53 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 110, type: !54, scopeLine: 111, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DISubroutineType(types: !55)
!55 = !{!56, !56, !57}
!56 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!58 = !DILocalVariable(name: "argc", arg: 1, scope: !53, file: !14, line: 110, type: !56)
!59 = !DILocation(line: 110, column: 14, scope: !53)
!60 = !DILocalVariable(name: "argv", arg: 2, scope: !53, file: !14, line: 110, type: !57)
!61 = !DILocation(line: 110, column: 27, scope: !53)
!62 = !DILocation(line: 113, column: 22, scope: !53)
!63 = !DILocation(line: 113, column: 12, scope: !53)
!64 = !DILocation(line: 113, column: 5, scope: !53)
!65 = !DILocation(line: 115, column: 5, scope: !53)
!66 = !DILocation(line: 116, column: 5, scope: !53)
!67 = !DILocation(line: 117, column: 5, scope: !53)
!68 = !DILocation(line: 120, column: 5, scope: !53)
!69 = !DILocation(line: 121, column: 5, scope: !53)
!70 = !DILocation(line: 122, column: 5, scope: !53)
!71 = !DILocation(line: 124, column: 5, scope: !53)
!72 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 48, type: !15, scopeLine: 49, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DILocalVariable(name: "data", scope: !72, file: !14, line: 50, type: !4)
!74 = !DILocation(line: 50, column: 12, scope: !72)
!75 = !DILocalVariable(name: "dataBuffer", scope: !72, file: !14, line: 51, type: !4)
!76 = !DILocation(line: 51, column: 12, scope: !72)
!77 = !DILocation(line: 51, column: 33, scope: !72)
!78 = !DILocation(line: 52, column: 12, scope: !72)
!79 = !DILocation(line: 52, column: 10, scope: !72)
!80 = !DILocation(line: 53, column: 8, scope: !81)
!81 = distinct !DILexicalBlock(scope: !72, file: !14, line: 53, column: 8)
!82 = !DILocation(line: 53, column: 8, scope: !72)
!83 = !DILocation(line: 56, column: 9, scope: !84)
!84 = distinct !DILexicalBlock(scope: !81, file: !14, line: 54, column: 5)
!85 = !DILocation(line: 57, column: 5, scope: !84)
!86 = !DILocation(line: 61, column: 16, scope: !87)
!87 = distinct !DILexicalBlock(scope: !81, file: !14, line: 59, column: 5)
!88 = !DILocation(line: 61, column: 9, scope: !87)
!89 = !DILocation(line: 62, column: 9, scope: !87)
!90 = !DILocation(line: 62, column: 20, scope: !87)
!91 = !DILocalVariable(name: "dest", scope: !92, file: !14, line: 65, type: !35)
!92 = distinct !DILexicalBlock(scope: !72, file: !14, line: 64, column: 5)
!93 = !DILocation(line: 65, column: 14, scope: !92)
!94 = !DILocation(line: 67, column: 17, scope: !92)
!95 = !DILocation(line: 67, column: 23, scope: !92)
!96 = !DILocation(line: 67, column: 36, scope: !92)
!97 = !DILocation(line: 67, column: 29, scope: !92)
!98 = !DILocation(line: 67, column: 9, scope: !92)
!99 = !DILocation(line: 68, column: 9, scope: !92)
!100 = !DILocation(line: 68, column: 20, scope: !92)
!101 = !DILocation(line: 69, column: 19, scope: !92)
!102 = !DILocation(line: 69, column: 9, scope: !92)
!103 = !DILocation(line: 71, column: 1, scope: !72)
!104 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 74, type: !15, scopeLine: 75, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!105 = !DILocalVariable(name: "data", scope: !104, file: !14, line: 76, type: !4)
!106 = !DILocation(line: 76, column: 12, scope: !104)
!107 = !DILocalVariable(name: "dataBuffer", scope: !104, file: !14, line: 77, type: !4)
!108 = !DILocation(line: 77, column: 12, scope: !104)
!109 = !DILocation(line: 77, column: 33, scope: !104)
!110 = !DILocation(line: 78, column: 12, scope: !104)
!111 = !DILocation(line: 78, column: 10, scope: !104)
!112 = !DILocation(line: 79, column: 8, scope: !113)
!113 = distinct !DILexicalBlock(scope: !104, file: !14, line: 79, column: 8)
!114 = !DILocation(line: 79, column: 8, scope: !104)
!115 = !DILocation(line: 82, column: 16, scope: !116)
!116 = distinct !DILexicalBlock(scope: !113, file: !14, line: 80, column: 5)
!117 = !DILocation(line: 82, column: 9, scope: !116)
!118 = !DILocation(line: 83, column: 9, scope: !116)
!119 = !DILocation(line: 83, column: 20, scope: !116)
!120 = !DILocation(line: 84, column: 5, scope: !116)
!121 = !DILocalVariable(name: "dest", scope: !122, file: !14, line: 86, type: !35)
!122 = distinct !DILexicalBlock(scope: !104, file: !14, line: 85, column: 5)
!123 = !DILocation(line: 86, column: 14, scope: !122)
!124 = !DILocation(line: 88, column: 17, scope: !122)
!125 = !DILocation(line: 88, column: 23, scope: !122)
!126 = !DILocation(line: 88, column: 36, scope: !122)
!127 = !DILocation(line: 88, column: 29, scope: !122)
!128 = !DILocation(line: 88, column: 9, scope: !122)
!129 = !DILocation(line: 89, column: 9, scope: !122)
!130 = !DILocation(line: 89, column: 20, scope: !122)
!131 = !DILocation(line: 90, column: 19, scope: !122)
!132 = !DILocation(line: 90, column: 9, scope: !122)
!133 = !DILocation(line: 92, column: 1, scope: !104)

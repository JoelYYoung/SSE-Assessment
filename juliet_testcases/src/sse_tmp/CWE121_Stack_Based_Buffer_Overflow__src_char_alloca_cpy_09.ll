; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_09.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_09.c"
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_09_bad() #0 !dbg !13 {
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
  %call = call i8* @strcpy(i8* %arraydecay, i8* %6) #5, !dbg !41
  %7 = load i8*, i8** %data, align 8, !dbg !42
  call void @printLine(i8* %7), !dbg !43
  ret void, !dbg !44
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_09_good() #0 !dbg !45 {
entry:
  call void @goodG2B1(), !dbg !46
  call void @goodG2B2(), !dbg !47
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !54, metadata !DIExpression()), !dbg !55
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !56, metadata !DIExpression()), !dbg !57
  %call = call i64 @time(i64* null) #5, !dbg !58
  %conv = trunc i64 %call to i32, !dbg !59
  call void @srand(i32 %conv) #5, !dbg !60
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !61
  call void @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_09_good(), !dbg !62
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !64
  call void @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_09_bad(), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !66
  ret i32 0, !dbg !67
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !68 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !69, metadata !DIExpression()), !dbg !70
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !71, metadata !DIExpression()), !dbg !72
  %0 = alloca i8, i64 100, align 16, !dbg !73
  store i8* %0, i8** %dataBuffer, align 8, !dbg !72
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !74
  store i8* %1, i8** %data, align 8, !dbg !75
  %2 = load i32, i32* @GLOBAL_CONST_FALSE, align 4, !dbg !76
  %tobool = icmp ne i32 %2, 0, !dbg !76
  br i1 %tobool, label %if.then, label %if.else, !dbg !78

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !79
  br label %if.end, !dbg !81

if.else:                                          ; preds = %entry
  %3 = load i8*, i8** %data, align 8, !dbg !82
  call void @llvm.memset.p0i8.i64(i8* align 1 %3, i8 65, i64 49, i1 false), !dbg !84
  %4 = load i8*, i8** %data, align 8, !dbg !85
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 49, !dbg !85
  store i8 0, i8* %arrayidx, align 1, !dbg !86
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !87, metadata !DIExpression()), !dbg !89
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !89
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !89
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !90
  %6 = load i8*, i8** %data, align 8, !dbg !91
  %call = call i8* @strcpy(i8* %arraydecay, i8* %6) #5, !dbg !92
  %7 = load i8*, i8** %data, align 8, !dbg !93
  call void @printLine(i8* %7), !dbg !94
  ret void, !dbg !95
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !96 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !97, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !99, metadata !DIExpression()), !dbg !100
  %0 = alloca i8, i64 100, align 16, !dbg !101
  store i8* %0, i8** %dataBuffer, align 8, !dbg !100
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !102
  store i8* %1, i8** %data, align 8, !dbg !103
  %2 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !104
  %tobool = icmp ne i32 %2, 0, !dbg !104
  br i1 %tobool, label %if.then, label %if.end, !dbg !106

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %data, align 8, !dbg !107
  call void @llvm.memset.p0i8.i64(i8* align 1 %3, i8 65, i64 49, i1 false), !dbg !109
  %4 = load i8*, i8** %data, align 8, !dbg !110
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 49, !dbg !110
  store i8 0, i8* %arrayidx, align 1, !dbg !111
  br label %if.end, !dbg !112

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !113, metadata !DIExpression()), !dbg !115
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !115
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !115
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !116
  %6 = load i8*, i8** %data, align 8, !dbg !117
  %call = call i8* @strcpy(i8* %arraydecay, i8* %6) #5, !dbg !118
  %7 = load i8*, i8** %data, align 8, !dbg !119
  call void @printLine(i8* %7), !dbg !120
  ret void, !dbg !121
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_09.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_09_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_09.c", directory: "/home/joelyang/SSE-Assessment")
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
!39 = !DILocation(line: 37, column: 16, scope: !34)
!40 = !DILocation(line: 37, column: 22, scope: !34)
!41 = !DILocation(line: 37, column: 9, scope: !34)
!42 = !DILocation(line: 38, column: 19, scope: !34)
!43 = !DILocation(line: 38, column: 9, scope: !34)
!44 = !DILocation(line: 40, column: 1, scope: !13)
!45 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_09_good", scope: !14, file: !14, line: 91, type: !15, scopeLine: 92, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!46 = !DILocation(line: 93, column: 5, scope: !45)
!47 = !DILocation(line: 94, column: 5, scope: !45)
!48 = !DILocation(line: 95, column: 1, scope: !45)
!49 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 107, type: !50, scopeLine: 108, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!50 = !DISubroutineType(types: !51)
!51 = !{!52, !52, !53}
!52 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!54 = !DILocalVariable(name: "argc", arg: 1, scope: !49, file: !14, line: 107, type: !52)
!55 = !DILocation(line: 107, column: 14, scope: !49)
!56 = !DILocalVariable(name: "argv", arg: 2, scope: !49, file: !14, line: 107, type: !53)
!57 = !DILocation(line: 107, column: 27, scope: !49)
!58 = !DILocation(line: 110, column: 22, scope: !49)
!59 = !DILocation(line: 110, column: 12, scope: !49)
!60 = !DILocation(line: 110, column: 5, scope: !49)
!61 = !DILocation(line: 112, column: 5, scope: !49)
!62 = !DILocation(line: 113, column: 5, scope: !49)
!63 = !DILocation(line: 114, column: 5, scope: !49)
!64 = !DILocation(line: 117, column: 5, scope: !49)
!65 = !DILocation(line: 118, column: 5, scope: !49)
!66 = !DILocation(line: 119, column: 5, scope: !49)
!67 = !DILocation(line: 121, column: 5, scope: !49)
!68 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 47, type: !15, scopeLine: 48, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DILocalVariable(name: "data", scope: !68, file: !14, line: 49, type: !4)
!70 = !DILocation(line: 49, column: 12, scope: !68)
!71 = !DILocalVariable(name: "dataBuffer", scope: !68, file: !14, line: 50, type: !4)
!72 = !DILocation(line: 50, column: 12, scope: !68)
!73 = !DILocation(line: 50, column: 33, scope: !68)
!74 = !DILocation(line: 51, column: 12, scope: !68)
!75 = !DILocation(line: 51, column: 10, scope: !68)
!76 = !DILocation(line: 52, column: 8, scope: !77)
!77 = distinct !DILexicalBlock(scope: !68, file: !14, line: 52, column: 8)
!78 = !DILocation(line: 52, column: 8, scope: !68)
!79 = !DILocation(line: 55, column: 9, scope: !80)
!80 = distinct !DILexicalBlock(scope: !77, file: !14, line: 53, column: 5)
!81 = !DILocation(line: 56, column: 5, scope: !80)
!82 = !DILocation(line: 60, column: 16, scope: !83)
!83 = distinct !DILexicalBlock(scope: !77, file: !14, line: 58, column: 5)
!84 = !DILocation(line: 60, column: 9, scope: !83)
!85 = !DILocation(line: 61, column: 9, scope: !83)
!86 = !DILocation(line: 61, column: 20, scope: !83)
!87 = !DILocalVariable(name: "dest", scope: !88, file: !14, line: 64, type: !35)
!88 = distinct !DILexicalBlock(scope: !68, file: !14, line: 63, column: 5)
!89 = !DILocation(line: 64, column: 14, scope: !88)
!90 = !DILocation(line: 66, column: 16, scope: !88)
!91 = !DILocation(line: 66, column: 22, scope: !88)
!92 = !DILocation(line: 66, column: 9, scope: !88)
!93 = !DILocation(line: 67, column: 19, scope: !88)
!94 = !DILocation(line: 67, column: 9, scope: !88)
!95 = !DILocation(line: 69, column: 1, scope: !68)
!96 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 72, type: !15, scopeLine: 73, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!97 = !DILocalVariable(name: "data", scope: !96, file: !14, line: 74, type: !4)
!98 = !DILocation(line: 74, column: 12, scope: !96)
!99 = !DILocalVariable(name: "dataBuffer", scope: !96, file: !14, line: 75, type: !4)
!100 = !DILocation(line: 75, column: 12, scope: !96)
!101 = !DILocation(line: 75, column: 33, scope: !96)
!102 = !DILocation(line: 76, column: 12, scope: !96)
!103 = !DILocation(line: 76, column: 10, scope: !96)
!104 = !DILocation(line: 77, column: 8, scope: !105)
!105 = distinct !DILexicalBlock(scope: !96, file: !14, line: 77, column: 8)
!106 = !DILocation(line: 77, column: 8, scope: !96)
!107 = !DILocation(line: 80, column: 16, scope: !108)
!108 = distinct !DILexicalBlock(scope: !105, file: !14, line: 78, column: 5)
!109 = !DILocation(line: 80, column: 9, scope: !108)
!110 = !DILocation(line: 81, column: 9, scope: !108)
!111 = !DILocation(line: 81, column: 20, scope: !108)
!112 = !DILocation(line: 82, column: 5, scope: !108)
!113 = !DILocalVariable(name: "dest", scope: !114, file: !14, line: 84, type: !35)
!114 = distinct !DILexicalBlock(scope: !96, file: !14, line: 83, column: 5)
!115 = !DILocation(line: 84, column: 14, scope: !114)
!116 = !DILocation(line: 86, column: 16, scope: !114)
!117 = !DILocation(line: 86, column: 22, scope: !114)
!118 = !DILocation(line: 86, column: 9, scope: !114)
!119 = !DILocation(line: 87, column: 19, scope: !114)
!120 = !DILocation(line: 87, column: 9, scope: !114)
!121 = !DILocation(line: 89, column: 1, scope: !96)

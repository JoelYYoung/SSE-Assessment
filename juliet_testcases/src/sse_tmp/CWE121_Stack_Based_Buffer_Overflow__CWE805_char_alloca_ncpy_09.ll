; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_09.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_09.c"
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_09_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = alloca i8, i64 50, align 16, !dbg !21
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !20
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !22, metadata !DIExpression()), !dbg !23
  %1 = alloca i8, i64 100, align 16, !dbg !24
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !23
  %2 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !25
  %tobool = icmp ne i32 %2, 0, !dbg !25
  br i1 %tobool, label %if.then, label %if.end, !dbg !27

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !28
  store i8* %3, i8** %data, align 8, !dbg !30
  %4 = load i8*, i8** %data, align 8, !dbg !31
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 0, !dbg !31
  store i8 0, i8* %arrayidx, align 1, !dbg !32
  br label %if.end, !dbg !33

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !34, metadata !DIExpression()), !dbg !39
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !40
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !40
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !41
  store i8 0, i8* %arrayidx1, align 1, !dbg !42
  %5 = load i8*, i8** %data, align 8, !dbg !43
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !44
  %call = call i8* @strncpy(i8* %5, i8* %arraydecay2, i64 99) #5, !dbg !45
  %6 = load i8*, i8** %data, align 8, !dbg !46
  %arrayidx3 = getelementptr inbounds i8, i8* %6, i64 99, !dbg !46
  store i8 0, i8* %arrayidx3, align 1, !dbg !47
  %7 = load i8*, i8** %data, align 8, !dbg !48
  call void @printLine(i8* %7), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8*, i8*, i64) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_09_good() #0 !dbg !51 {
entry:
  call void @goodG2B1(), !dbg !52
  call void @goodG2B2(), !dbg !53
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
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !67
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_09_good(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !70
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_09_bad(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !72
  ret i32 0, !dbg !73
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !74 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !75, metadata !DIExpression()), !dbg !76
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !77, metadata !DIExpression()), !dbg !78
  %0 = alloca i8, i64 50, align 16, !dbg !79
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !78
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !80, metadata !DIExpression()), !dbg !81
  %1 = alloca i8, i64 100, align 16, !dbg !82
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !81
  %2 = load i32, i32* @GLOBAL_CONST_FALSE, align 4, !dbg !83
  %tobool = icmp ne i32 %2, 0, !dbg !83
  br i1 %tobool, label %if.then, label %if.else, !dbg !85

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !86
  br label %if.end, !dbg !88

if.else:                                          ; preds = %entry
  %3 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !89
  store i8* %3, i8** %data, align 8, !dbg !91
  %4 = load i8*, i8** %data, align 8, !dbg !92
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 0, !dbg !92
  store i8 0, i8* %arrayidx, align 1, !dbg !93
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !94, metadata !DIExpression()), !dbg !96
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !97
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !97
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !98
  store i8 0, i8* %arrayidx1, align 1, !dbg !99
  %5 = load i8*, i8** %data, align 8, !dbg !100
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !101
  %call = call i8* @strncpy(i8* %5, i8* %arraydecay2, i64 99) #5, !dbg !102
  %6 = load i8*, i8** %data, align 8, !dbg !103
  %arrayidx3 = getelementptr inbounds i8, i8* %6, i64 99, !dbg !103
  store i8 0, i8* %arrayidx3, align 1, !dbg !104
  %7 = load i8*, i8** %data, align 8, !dbg !105
  call void @printLine(i8* %7), !dbg !106
  ret void, !dbg !107
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !108 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !109, metadata !DIExpression()), !dbg !110
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !111, metadata !DIExpression()), !dbg !112
  %0 = alloca i8, i64 50, align 16, !dbg !113
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !112
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !114, metadata !DIExpression()), !dbg !115
  %1 = alloca i8, i64 100, align 16, !dbg !116
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !115
  %2 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !117
  %tobool = icmp ne i32 %2, 0, !dbg !117
  br i1 %tobool, label %if.then, label %if.end, !dbg !119

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !120
  store i8* %3, i8** %data, align 8, !dbg !122
  %4 = load i8*, i8** %data, align 8, !dbg !123
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 0, !dbg !123
  store i8 0, i8* %arrayidx, align 1, !dbg !124
  br label %if.end, !dbg !125

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !126, metadata !DIExpression()), !dbg !128
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !129
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !129
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !130
  store i8 0, i8* %arrayidx1, align 1, !dbg !131
  %5 = load i8*, i8** %data, align 8, !dbg !132
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !133
  %call = call i8* @strncpy(i8* %5, i8* %arraydecay2, i64 99) #5, !dbg !134
  %6 = load i8*, i8** %data, align 8, !dbg !135
  %arrayidx3 = getelementptr inbounds i8, i8* %6, i64 99, !dbg !135
  store i8 0, i8* %arrayidx3, align 1, !dbg !136
  %7 = load i8*, i8** %data, align 8, !dbg !137
  call void @printLine(i8* %7), !dbg !138
  ret void, !dbg !139
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_09.c", directory: "/root/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_09_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_09.c", directory: "/root/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 25, type: !4)
!18 = !DILocation(line: 25, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 26, type: !4)
!20 = !DILocation(line: 26, column: 12, scope: !13)
!21 = !DILocation(line: 26, column: 36, scope: !13)
!22 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 27, type: !4)
!23 = !DILocation(line: 27, column: 12, scope: !13)
!24 = !DILocation(line: 27, column: 37, scope: !13)
!25 = !DILocation(line: 28, column: 8, scope: !26)
!26 = distinct !DILexicalBlock(scope: !13, file: !14, line: 28, column: 8)
!27 = !DILocation(line: 28, column: 8, scope: !13)
!28 = !DILocation(line: 32, column: 16, scope: !29)
!29 = distinct !DILexicalBlock(scope: !26, file: !14, line: 29, column: 5)
!30 = !DILocation(line: 32, column: 14, scope: !29)
!31 = !DILocation(line: 33, column: 9, scope: !29)
!32 = !DILocation(line: 33, column: 17, scope: !29)
!33 = !DILocation(line: 34, column: 5, scope: !29)
!34 = !DILocalVariable(name: "source", scope: !35, file: !14, line: 36, type: !36)
!35 = distinct !DILexicalBlock(scope: !13, file: !14, line: 35, column: 5)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 100)
!39 = !DILocation(line: 36, column: 14, scope: !35)
!40 = !DILocation(line: 37, column: 9, scope: !35)
!41 = !DILocation(line: 38, column: 9, scope: !35)
!42 = !DILocation(line: 38, column: 23, scope: !35)
!43 = !DILocation(line: 40, column: 17, scope: !35)
!44 = !DILocation(line: 40, column: 23, scope: !35)
!45 = !DILocation(line: 40, column: 9, scope: !35)
!46 = !DILocation(line: 41, column: 9, scope: !35)
!47 = !DILocation(line: 41, column: 21, scope: !35)
!48 = !DILocation(line: 42, column: 19, scope: !35)
!49 = !DILocation(line: 42, column: 9, scope: !35)
!50 = !DILocation(line: 44, column: 1, scope: !13)
!51 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_09_good", scope: !14, file: !14, line: 101, type: !15, scopeLine: 102, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!52 = !DILocation(line: 103, column: 5, scope: !51)
!53 = !DILocation(line: 104, column: 5, scope: !51)
!54 = !DILocation(line: 105, column: 1, scope: !51)
!55 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 117, type: !56, scopeLine: 118, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DISubroutineType(types: !57)
!57 = !{!58, !58, !59}
!58 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!60 = !DILocalVariable(name: "argc", arg: 1, scope: !55, file: !14, line: 117, type: !58)
!61 = !DILocation(line: 117, column: 14, scope: !55)
!62 = !DILocalVariable(name: "argv", arg: 2, scope: !55, file: !14, line: 117, type: !59)
!63 = !DILocation(line: 117, column: 27, scope: !55)
!64 = !DILocation(line: 120, column: 22, scope: !55)
!65 = !DILocation(line: 120, column: 12, scope: !55)
!66 = !DILocation(line: 120, column: 5, scope: !55)
!67 = !DILocation(line: 122, column: 5, scope: !55)
!68 = !DILocation(line: 123, column: 5, scope: !55)
!69 = !DILocation(line: 124, column: 5, scope: !55)
!70 = !DILocation(line: 127, column: 5, scope: !55)
!71 = !DILocation(line: 128, column: 5, scope: !55)
!72 = !DILocation(line: 129, column: 5, scope: !55)
!73 = !DILocation(line: 131, column: 5, scope: !55)
!74 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 51, type: !15, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DILocalVariable(name: "data", scope: !74, file: !14, line: 53, type: !4)
!76 = !DILocation(line: 53, column: 12, scope: !74)
!77 = !DILocalVariable(name: "dataBadBuffer", scope: !74, file: !14, line: 54, type: !4)
!78 = !DILocation(line: 54, column: 12, scope: !74)
!79 = !DILocation(line: 54, column: 36, scope: !74)
!80 = !DILocalVariable(name: "dataGoodBuffer", scope: !74, file: !14, line: 55, type: !4)
!81 = !DILocation(line: 55, column: 12, scope: !74)
!82 = !DILocation(line: 55, column: 37, scope: !74)
!83 = !DILocation(line: 56, column: 8, scope: !84)
!84 = distinct !DILexicalBlock(scope: !74, file: !14, line: 56, column: 8)
!85 = !DILocation(line: 56, column: 8, scope: !74)
!86 = !DILocation(line: 59, column: 9, scope: !87)
!87 = distinct !DILexicalBlock(scope: !84, file: !14, line: 57, column: 5)
!88 = !DILocation(line: 60, column: 5, scope: !87)
!89 = !DILocation(line: 64, column: 16, scope: !90)
!90 = distinct !DILexicalBlock(scope: !84, file: !14, line: 62, column: 5)
!91 = !DILocation(line: 64, column: 14, scope: !90)
!92 = !DILocation(line: 65, column: 9, scope: !90)
!93 = !DILocation(line: 65, column: 17, scope: !90)
!94 = !DILocalVariable(name: "source", scope: !95, file: !14, line: 68, type: !36)
!95 = distinct !DILexicalBlock(scope: !74, file: !14, line: 67, column: 5)
!96 = !DILocation(line: 68, column: 14, scope: !95)
!97 = !DILocation(line: 69, column: 9, scope: !95)
!98 = !DILocation(line: 70, column: 9, scope: !95)
!99 = !DILocation(line: 70, column: 23, scope: !95)
!100 = !DILocation(line: 72, column: 17, scope: !95)
!101 = !DILocation(line: 72, column: 23, scope: !95)
!102 = !DILocation(line: 72, column: 9, scope: !95)
!103 = !DILocation(line: 73, column: 9, scope: !95)
!104 = !DILocation(line: 73, column: 21, scope: !95)
!105 = !DILocation(line: 74, column: 19, scope: !95)
!106 = !DILocation(line: 74, column: 9, scope: !95)
!107 = !DILocation(line: 76, column: 1, scope: !74)
!108 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 79, type: !15, scopeLine: 80, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!109 = !DILocalVariable(name: "data", scope: !108, file: !14, line: 81, type: !4)
!110 = !DILocation(line: 81, column: 12, scope: !108)
!111 = !DILocalVariable(name: "dataBadBuffer", scope: !108, file: !14, line: 82, type: !4)
!112 = !DILocation(line: 82, column: 12, scope: !108)
!113 = !DILocation(line: 82, column: 36, scope: !108)
!114 = !DILocalVariable(name: "dataGoodBuffer", scope: !108, file: !14, line: 83, type: !4)
!115 = !DILocation(line: 83, column: 12, scope: !108)
!116 = !DILocation(line: 83, column: 37, scope: !108)
!117 = !DILocation(line: 84, column: 8, scope: !118)
!118 = distinct !DILexicalBlock(scope: !108, file: !14, line: 84, column: 8)
!119 = !DILocation(line: 84, column: 8, scope: !108)
!120 = !DILocation(line: 87, column: 16, scope: !121)
!121 = distinct !DILexicalBlock(scope: !118, file: !14, line: 85, column: 5)
!122 = !DILocation(line: 87, column: 14, scope: !121)
!123 = !DILocation(line: 88, column: 9, scope: !121)
!124 = !DILocation(line: 88, column: 17, scope: !121)
!125 = !DILocation(line: 89, column: 5, scope: !121)
!126 = !DILocalVariable(name: "source", scope: !127, file: !14, line: 91, type: !36)
!127 = distinct !DILexicalBlock(scope: !108, file: !14, line: 90, column: 5)
!128 = !DILocation(line: 91, column: 14, scope: !127)
!129 = !DILocation(line: 92, column: 9, scope: !127)
!130 = !DILocation(line: 93, column: 9, scope: !127)
!131 = !DILocation(line: 93, column: 23, scope: !127)
!132 = !DILocation(line: 95, column: 17, scope: !127)
!133 = !DILocation(line: 95, column: 23, scope: !127)
!134 = !DILocation(line: 95, column: 9, scope: !127)
!135 = !DILocation(line: 96, column: 9, scope: !127)
!136 = !DILocation(line: 96, column: 21, scope: !127)
!137 = !DILocation(line: 97, column: 19, scope: !127)
!138 = !DILocation(line: 97, column: 9, scope: !127)
!139 = !DILocation(line: 99, column: 1, scope: !108)

; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memmove_05.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memmove_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !10
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memmove_05_bad() #0 !dbg !20 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !23, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !25, metadata !DIExpression()), !dbg !26
  %0 = alloca i8, i64 50, align 16, !dbg !27
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !26
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !28, metadata !DIExpression()), !dbg !29
  %1 = alloca i8, i64 100, align 16, !dbg !30
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !29
  %2 = load i32, i32* @staticTrue, align 4, !dbg !31
  %tobool = icmp ne i32 %2, 0, !dbg !31
  br i1 %tobool, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !34
  store i8* %3, i8** %data, align 8, !dbg !36
  %4 = load i8*, i8** %data, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 0, !dbg !37
  store i8 0, i8* %arrayidx, align 1, !dbg !38
  br label %if.end, !dbg !39

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !40, metadata !DIExpression()), !dbg !45
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !46
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !46
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !47
  store i8 0, i8* %arrayidx1, align 1, !dbg !48
  %5 = load i8*, i8** %data, align 8, !dbg !49
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !50
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %5, i8* align 16 %arraydecay2, i64 100, i1 false), !dbg !50
  %6 = load i8*, i8** %data, align 8, !dbg !51
  %arrayidx3 = getelementptr inbounds i8, i8* %6, i64 99, !dbg !51
  store i8 0, i8* %arrayidx3, align 1, !dbg !52
  %7 = load i8*, i8** %data, align 8, !dbg !53
  call void @printLine(i8* %7), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memmove_05_good() #0 !dbg !56 {
entry:
  call void @goodG2B1(), !dbg !57
  call void @goodG2B2(), !dbg !58
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !64, metadata !DIExpression()), !dbg !65
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !66, metadata !DIExpression()), !dbg !67
  %call = call i64 @time(i64* null) #6, !dbg !68
  %conv = trunc i64 %call to i32, !dbg !69
  call void @srand(i32 %conv) #6, !dbg !70
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !71
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memmove_05_good(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !74
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memmove_05_bad(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !76
  ret i32 0, !dbg !77
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !78 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !79, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !81, metadata !DIExpression()), !dbg !82
  %0 = alloca i8, i64 50, align 16, !dbg !83
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !82
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !84, metadata !DIExpression()), !dbg !85
  %1 = alloca i8, i64 100, align 16, !dbg !86
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !85
  %2 = load i32, i32* @staticFalse, align 4, !dbg !87
  %tobool = icmp ne i32 %2, 0, !dbg !87
  br i1 %tobool, label %if.then, label %if.else, !dbg !89

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !90
  br label %if.end, !dbg !92

if.else:                                          ; preds = %entry
  %3 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !93
  store i8* %3, i8** %data, align 8, !dbg !95
  %4 = load i8*, i8** %data, align 8, !dbg !96
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 0, !dbg !96
  store i8 0, i8* %arrayidx, align 1, !dbg !97
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !98, metadata !DIExpression()), !dbg !100
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !101
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !101
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !102
  store i8 0, i8* %arrayidx1, align 1, !dbg !103
  %5 = load i8*, i8** %data, align 8, !dbg !104
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !105
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %5, i8* align 16 %arraydecay2, i64 100, i1 false), !dbg !105
  %6 = load i8*, i8** %data, align 8, !dbg !106
  %arrayidx3 = getelementptr inbounds i8, i8* %6, i64 99, !dbg !106
  store i8 0, i8* %arrayidx3, align 1, !dbg !107
  %7 = load i8*, i8** %data, align 8, !dbg !108
  call void @printLine(i8* %7), !dbg !109
  ret void, !dbg !110
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !111 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !112, metadata !DIExpression()), !dbg !113
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !114, metadata !DIExpression()), !dbg !115
  %0 = alloca i8, i64 50, align 16, !dbg !116
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !115
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !117, metadata !DIExpression()), !dbg !118
  %1 = alloca i8, i64 100, align 16, !dbg !119
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !118
  %2 = load i32, i32* @staticTrue, align 4, !dbg !120
  %tobool = icmp ne i32 %2, 0, !dbg !120
  br i1 %tobool, label %if.then, label %if.end, !dbg !122

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !123
  store i8* %3, i8** %data, align 8, !dbg !125
  %4 = load i8*, i8** %data, align 8, !dbg !126
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 0, !dbg !126
  store i8 0, i8* %arrayidx, align 1, !dbg !127
  br label %if.end, !dbg !128

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !129, metadata !DIExpression()), !dbg !131
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !132
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !132
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !133
  store i8 0, i8* %arrayidx1, align 1, !dbg !134
  %5 = load i8*, i8** %data, align 8, !dbg !135
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !136
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %5, i8* align 16 %arraydecay2, i64 100, i1 false), !dbg !136
  %6 = load i8*, i8** %data, align 8, !dbg !137
  %arrayidx3 = getelementptr inbounds i8, i8* %6, i64 99, !dbg !137
  store i8 0, i8* %arrayidx3, align 1, !dbg !138
  %7 = load i8*, i8** %data, align 8, !dbg !139
  call void @printLine(i8* %7), !dbg !140
  ret void, !dbg !141
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !12, line: 25, type: !13, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !9, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memmove_05.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{!0, !10}
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !12, line: 26, type: !13, isLocal: true, isDefinition: true)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memmove_05.c", directory: "/root/SSE-Assessment")
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memmove_05_bad", scope: !12, file: !12, line: 30, type: !21, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !12, line: 32, type: !6)
!24 = !DILocation(line: 32, column: 12, scope: !20)
!25 = !DILocalVariable(name: "dataBadBuffer", scope: !20, file: !12, line: 33, type: !6)
!26 = !DILocation(line: 33, column: 12, scope: !20)
!27 = !DILocation(line: 33, column: 36, scope: !20)
!28 = !DILocalVariable(name: "dataGoodBuffer", scope: !20, file: !12, line: 34, type: !6)
!29 = !DILocation(line: 34, column: 12, scope: !20)
!30 = !DILocation(line: 34, column: 37, scope: !20)
!31 = !DILocation(line: 35, column: 8, scope: !32)
!32 = distinct !DILexicalBlock(scope: !20, file: !12, line: 35, column: 8)
!33 = !DILocation(line: 35, column: 8, scope: !20)
!34 = !DILocation(line: 39, column: 16, scope: !35)
!35 = distinct !DILexicalBlock(scope: !32, file: !12, line: 36, column: 5)
!36 = !DILocation(line: 39, column: 14, scope: !35)
!37 = !DILocation(line: 40, column: 9, scope: !35)
!38 = !DILocation(line: 40, column: 17, scope: !35)
!39 = !DILocation(line: 41, column: 5, scope: !35)
!40 = !DILocalVariable(name: "source", scope: !41, file: !12, line: 43, type: !42)
!41 = distinct !DILexicalBlock(scope: !20, file: !12, line: 42, column: 5)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 800, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 100)
!45 = !DILocation(line: 43, column: 14, scope: !41)
!46 = !DILocation(line: 44, column: 9, scope: !41)
!47 = !DILocation(line: 45, column: 9, scope: !41)
!48 = !DILocation(line: 45, column: 23, scope: !41)
!49 = !DILocation(line: 47, column: 17, scope: !41)
!50 = !DILocation(line: 47, column: 9, scope: !41)
!51 = !DILocation(line: 48, column: 9, scope: !41)
!52 = !DILocation(line: 48, column: 21, scope: !41)
!53 = !DILocation(line: 49, column: 19, scope: !41)
!54 = !DILocation(line: 49, column: 9, scope: !41)
!55 = !DILocation(line: 51, column: 1, scope: !20)
!56 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memmove_05_good", scope: !12, file: !12, line: 108, type: !21, scopeLine: 109, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!57 = !DILocation(line: 110, column: 5, scope: !56)
!58 = !DILocation(line: 111, column: 5, scope: !56)
!59 = !DILocation(line: 112, column: 1, scope: !56)
!60 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 124, type: !61, scopeLine: 125, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!61 = !DISubroutineType(types: !62)
!62 = !{!13, !13, !63}
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!64 = !DILocalVariable(name: "argc", arg: 1, scope: !60, file: !12, line: 124, type: !13)
!65 = !DILocation(line: 124, column: 14, scope: !60)
!66 = !DILocalVariable(name: "argv", arg: 2, scope: !60, file: !12, line: 124, type: !63)
!67 = !DILocation(line: 124, column: 27, scope: !60)
!68 = !DILocation(line: 127, column: 22, scope: !60)
!69 = !DILocation(line: 127, column: 12, scope: !60)
!70 = !DILocation(line: 127, column: 5, scope: !60)
!71 = !DILocation(line: 129, column: 5, scope: !60)
!72 = !DILocation(line: 130, column: 5, scope: !60)
!73 = !DILocation(line: 131, column: 5, scope: !60)
!74 = !DILocation(line: 134, column: 5, scope: !60)
!75 = !DILocation(line: 135, column: 5, scope: !60)
!76 = !DILocation(line: 136, column: 5, scope: !60)
!77 = !DILocation(line: 138, column: 5, scope: !60)
!78 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 58, type: !21, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!79 = !DILocalVariable(name: "data", scope: !78, file: !12, line: 60, type: !6)
!80 = !DILocation(line: 60, column: 12, scope: !78)
!81 = !DILocalVariable(name: "dataBadBuffer", scope: !78, file: !12, line: 61, type: !6)
!82 = !DILocation(line: 61, column: 12, scope: !78)
!83 = !DILocation(line: 61, column: 36, scope: !78)
!84 = !DILocalVariable(name: "dataGoodBuffer", scope: !78, file: !12, line: 62, type: !6)
!85 = !DILocation(line: 62, column: 12, scope: !78)
!86 = !DILocation(line: 62, column: 37, scope: !78)
!87 = !DILocation(line: 63, column: 8, scope: !88)
!88 = distinct !DILexicalBlock(scope: !78, file: !12, line: 63, column: 8)
!89 = !DILocation(line: 63, column: 8, scope: !78)
!90 = !DILocation(line: 66, column: 9, scope: !91)
!91 = distinct !DILexicalBlock(scope: !88, file: !12, line: 64, column: 5)
!92 = !DILocation(line: 67, column: 5, scope: !91)
!93 = !DILocation(line: 71, column: 16, scope: !94)
!94 = distinct !DILexicalBlock(scope: !88, file: !12, line: 69, column: 5)
!95 = !DILocation(line: 71, column: 14, scope: !94)
!96 = !DILocation(line: 72, column: 9, scope: !94)
!97 = !DILocation(line: 72, column: 17, scope: !94)
!98 = !DILocalVariable(name: "source", scope: !99, file: !12, line: 75, type: !42)
!99 = distinct !DILexicalBlock(scope: !78, file: !12, line: 74, column: 5)
!100 = !DILocation(line: 75, column: 14, scope: !99)
!101 = !DILocation(line: 76, column: 9, scope: !99)
!102 = !DILocation(line: 77, column: 9, scope: !99)
!103 = !DILocation(line: 77, column: 23, scope: !99)
!104 = !DILocation(line: 79, column: 17, scope: !99)
!105 = !DILocation(line: 79, column: 9, scope: !99)
!106 = !DILocation(line: 80, column: 9, scope: !99)
!107 = !DILocation(line: 80, column: 21, scope: !99)
!108 = !DILocation(line: 81, column: 19, scope: !99)
!109 = !DILocation(line: 81, column: 9, scope: !99)
!110 = !DILocation(line: 83, column: 1, scope: !78)
!111 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 86, type: !21, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!112 = !DILocalVariable(name: "data", scope: !111, file: !12, line: 88, type: !6)
!113 = !DILocation(line: 88, column: 12, scope: !111)
!114 = !DILocalVariable(name: "dataBadBuffer", scope: !111, file: !12, line: 89, type: !6)
!115 = !DILocation(line: 89, column: 12, scope: !111)
!116 = !DILocation(line: 89, column: 36, scope: !111)
!117 = !DILocalVariable(name: "dataGoodBuffer", scope: !111, file: !12, line: 90, type: !6)
!118 = !DILocation(line: 90, column: 12, scope: !111)
!119 = !DILocation(line: 90, column: 37, scope: !111)
!120 = !DILocation(line: 91, column: 8, scope: !121)
!121 = distinct !DILexicalBlock(scope: !111, file: !12, line: 91, column: 8)
!122 = !DILocation(line: 91, column: 8, scope: !111)
!123 = !DILocation(line: 94, column: 16, scope: !124)
!124 = distinct !DILexicalBlock(scope: !121, file: !12, line: 92, column: 5)
!125 = !DILocation(line: 94, column: 14, scope: !124)
!126 = !DILocation(line: 95, column: 9, scope: !124)
!127 = !DILocation(line: 95, column: 17, scope: !124)
!128 = !DILocation(line: 96, column: 5, scope: !124)
!129 = !DILocalVariable(name: "source", scope: !130, file: !12, line: 98, type: !42)
!130 = distinct !DILexicalBlock(scope: !111, file: !12, line: 97, column: 5)
!131 = !DILocation(line: 98, column: 14, scope: !130)
!132 = !DILocation(line: 99, column: 9, scope: !130)
!133 = !DILocation(line: 100, column: 9, scope: !130)
!134 = !DILocation(line: 100, column: 23, scope: !130)
!135 = !DILocation(line: 102, column: 17, scope: !130)
!136 = !DILocation(line: 102, column: 9, scope: !130)
!137 = !DILocation(line: 103, column: 9, scope: !130)
!138 = !DILocation(line: 103, column: 21, scope: !130)
!139 = !DILocation(line: 104, column: 19, scope: !130)
!140 = !DILocation(line: 104, column: 9, scope: !130)
!141 = !DILocation(line: 106, column: 1, scope: !111)

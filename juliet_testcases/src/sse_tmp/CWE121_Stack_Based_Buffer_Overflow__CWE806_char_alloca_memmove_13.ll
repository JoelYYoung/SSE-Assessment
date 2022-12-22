; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memmove_13.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memmove_13.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@GLOBAL_CONST_FIVE = external dso_local constant i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memmove_13_bad() #0 !dbg !13 {
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
  %2 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !24
  %cmp = icmp eq i32 %2, 5, !dbg !26
  br i1 %cmp, label %if.then, label %if.end, !dbg !27

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %data, align 8, !dbg !28
  call void @llvm.memset.p0i8.i64(i8* align 1 %3, i8 65, i64 99, i1 false), !dbg !30
  %4 = load i8*, i8** %data, align 8, !dbg !31
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 99, !dbg !31
  store i8 0, i8* %arrayidx, align 1, !dbg !32
  br label %if.end, !dbg !33

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !34, metadata !DIExpression()), !dbg !39
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !39
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !39
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !40
  %6 = load i8*, i8** %data, align 8, !dbg !41
  %7 = load i8*, i8** %data, align 8, !dbg !42
  %call = call i64 @strlen(i8* %7) #7, !dbg !43
  %mul = mul i64 %call, 1, !dbg !44
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay, i8* align 1 %6, i64 %mul, i1 false), !dbg !40
  %arrayidx1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !45
  store i8 0, i8* %arrayidx1, align 1, !dbg !46
  %8 = load i8*, i8** %data, align 8, !dbg !47
  call void @printLine(i8* %8), !dbg !48
  ret void, !dbg !49
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memmove_13_good() #0 !dbg !50 {
entry:
  call void @goodG2B1(), !dbg !51
  call void @goodG2B2(), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !54 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !59, metadata !DIExpression()), !dbg !60
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !61, metadata !DIExpression()), !dbg !62
  %call = call i64 @time(i64* null) #8, !dbg !63
  %conv = trunc i64 %call to i32, !dbg !64
  call void @srand(i32 %conv) #8, !dbg !65
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !66
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memmove_13_good(), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !69
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memmove_13_bad(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !71
  ret i32 0, !dbg !72
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #6

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !73 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !74, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !76, metadata !DIExpression()), !dbg !77
  %0 = alloca i8, i64 100, align 16, !dbg !78
  store i8* %0, i8** %dataBuffer, align 8, !dbg !77
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !79
  store i8* %1, i8** %data, align 8, !dbg !80
  %2 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !81
  %cmp = icmp ne i32 %2, 5, !dbg !83
  br i1 %cmp, label %if.then, label %if.else, !dbg !84

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !85
  br label %if.end, !dbg !87

if.else:                                          ; preds = %entry
  %3 = load i8*, i8** %data, align 8, !dbg !88
  call void @llvm.memset.p0i8.i64(i8* align 1 %3, i8 65, i64 49, i1 false), !dbg !90
  %4 = load i8*, i8** %data, align 8, !dbg !91
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 49, !dbg !91
  store i8 0, i8* %arrayidx, align 1, !dbg !92
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !93, metadata !DIExpression()), !dbg !95
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !95
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !95
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !96
  %6 = load i8*, i8** %data, align 8, !dbg !97
  %7 = load i8*, i8** %data, align 8, !dbg !98
  %call = call i64 @strlen(i8* %7) #7, !dbg !99
  %mul = mul i64 %call, 1, !dbg !100
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay, i8* align 1 %6, i64 %mul, i1 false), !dbg !96
  %arrayidx1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !101
  store i8 0, i8* %arrayidx1, align 1, !dbg !102
  %8 = load i8*, i8** %data, align 8, !dbg !103
  call void @printLine(i8* %8), !dbg !104
  ret void, !dbg !105
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !106 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !107, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !109, metadata !DIExpression()), !dbg !110
  %0 = alloca i8, i64 100, align 16, !dbg !111
  store i8* %0, i8** %dataBuffer, align 8, !dbg !110
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !112
  store i8* %1, i8** %data, align 8, !dbg !113
  %2 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !114
  %cmp = icmp eq i32 %2, 5, !dbg !116
  br i1 %cmp, label %if.then, label %if.end, !dbg !117

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %data, align 8, !dbg !118
  call void @llvm.memset.p0i8.i64(i8* align 1 %3, i8 65, i64 49, i1 false), !dbg !120
  %4 = load i8*, i8** %data, align 8, !dbg !121
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 49, !dbg !121
  store i8 0, i8* %arrayidx, align 1, !dbg !122
  br label %if.end, !dbg !123

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !124, metadata !DIExpression()), !dbg !126
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !126
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !126
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !127
  %6 = load i8*, i8** %data, align 8, !dbg !128
  %7 = load i8*, i8** %data, align 8, !dbg !129
  %call = call i64 @strlen(i8* %7) #7, !dbg !130
  %mul = mul i64 %call, 1, !dbg !131
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay, i8* align 1 %6, i64 %mul, i1 false), !dbg !127
  %arrayidx1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !132
  store i8 0, i8* %arrayidx1, align 1, !dbg !133
  %8 = load i8*, i8** %data, align 8, !dbg !134
  call void @printLine(i8* %8), !dbg !135
  ret void, !dbg !136
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind readonly willreturn }
attributes #8 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memmove_13.c", directory: "/root/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memmove_13_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memmove_13.c", directory: "/root/SSE-Assessment")
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
!26 = !DILocation(line: 28, column: 25, scope: !25)
!27 = !DILocation(line: 28, column: 8, scope: !13)
!28 = !DILocation(line: 31, column: 16, scope: !29)
!29 = distinct !DILexicalBlock(scope: !25, file: !14, line: 29, column: 5)
!30 = !DILocation(line: 31, column: 9, scope: !29)
!31 = !DILocation(line: 32, column: 9, scope: !29)
!32 = !DILocation(line: 32, column: 21, scope: !29)
!33 = !DILocation(line: 33, column: 5, scope: !29)
!34 = !DILocalVariable(name: "dest", scope: !35, file: !14, line: 35, type: !36)
!35 = distinct !DILexicalBlock(scope: !13, file: !14, line: 34, column: 5)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 50)
!39 = !DILocation(line: 35, column: 14, scope: !35)
!40 = !DILocation(line: 37, column: 9, scope: !35)
!41 = !DILocation(line: 37, column: 23, scope: !35)
!42 = !DILocation(line: 37, column: 36, scope: !35)
!43 = !DILocation(line: 37, column: 29, scope: !35)
!44 = !DILocation(line: 37, column: 41, scope: !35)
!45 = !DILocation(line: 38, column: 9, scope: !35)
!46 = !DILocation(line: 38, column: 20, scope: !35)
!47 = !DILocation(line: 39, column: 19, scope: !35)
!48 = !DILocation(line: 39, column: 9, scope: !35)
!49 = !DILocation(line: 41, column: 1, scope: !13)
!50 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memmove_13_good", scope: !14, file: !14, line: 94, type: !15, scopeLine: 95, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!51 = !DILocation(line: 96, column: 5, scope: !50)
!52 = !DILocation(line: 97, column: 5, scope: !50)
!53 = !DILocation(line: 98, column: 1, scope: !50)
!54 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 110, type: !55, scopeLine: 111, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DISubroutineType(types: !56)
!56 = !{!57, !57, !58}
!57 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!59 = !DILocalVariable(name: "argc", arg: 1, scope: !54, file: !14, line: 110, type: !57)
!60 = !DILocation(line: 110, column: 14, scope: !54)
!61 = !DILocalVariable(name: "argv", arg: 2, scope: !54, file: !14, line: 110, type: !58)
!62 = !DILocation(line: 110, column: 27, scope: !54)
!63 = !DILocation(line: 113, column: 22, scope: !54)
!64 = !DILocation(line: 113, column: 12, scope: !54)
!65 = !DILocation(line: 113, column: 5, scope: !54)
!66 = !DILocation(line: 115, column: 5, scope: !54)
!67 = !DILocation(line: 116, column: 5, scope: !54)
!68 = !DILocation(line: 117, column: 5, scope: !54)
!69 = !DILocation(line: 120, column: 5, scope: !54)
!70 = !DILocation(line: 121, column: 5, scope: !54)
!71 = !DILocation(line: 122, column: 5, scope: !54)
!72 = !DILocation(line: 124, column: 5, scope: !54)
!73 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 48, type: !15, scopeLine: 49, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DILocalVariable(name: "data", scope: !73, file: !14, line: 50, type: !4)
!75 = !DILocation(line: 50, column: 12, scope: !73)
!76 = !DILocalVariable(name: "dataBuffer", scope: !73, file: !14, line: 51, type: !4)
!77 = !DILocation(line: 51, column: 12, scope: !73)
!78 = !DILocation(line: 51, column: 33, scope: !73)
!79 = !DILocation(line: 52, column: 12, scope: !73)
!80 = !DILocation(line: 52, column: 10, scope: !73)
!81 = !DILocation(line: 53, column: 8, scope: !82)
!82 = distinct !DILexicalBlock(scope: !73, file: !14, line: 53, column: 8)
!83 = !DILocation(line: 53, column: 25, scope: !82)
!84 = !DILocation(line: 53, column: 8, scope: !73)
!85 = !DILocation(line: 56, column: 9, scope: !86)
!86 = distinct !DILexicalBlock(scope: !82, file: !14, line: 54, column: 5)
!87 = !DILocation(line: 57, column: 5, scope: !86)
!88 = !DILocation(line: 61, column: 16, scope: !89)
!89 = distinct !DILexicalBlock(scope: !82, file: !14, line: 59, column: 5)
!90 = !DILocation(line: 61, column: 9, scope: !89)
!91 = !DILocation(line: 62, column: 9, scope: !89)
!92 = !DILocation(line: 62, column: 20, scope: !89)
!93 = !DILocalVariable(name: "dest", scope: !94, file: !14, line: 65, type: !36)
!94 = distinct !DILexicalBlock(scope: !73, file: !14, line: 64, column: 5)
!95 = !DILocation(line: 65, column: 14, scope: !94)
!96 = !DILocation(line: 67, column: 9, scope: !94)
!97 = !DILocation(line: 67, column: 23, scope: !94)
!98 = !DILocation(line: 67, column: 36, scope: !94)
!99 = !DILocation(line: 67, column: 29, scope: !94)
!100 = !DILocation(line: 67, column: 41, scope: !94)
!101 = !DILocation(line: 68, column: 9, scope: !94)
!102 = !DILocation(line: 68, column: 20, scope: !94)
!103 = !DILocation(line: 69, column: 19, scope: !94)
!104 = !DILocation(line: 69, column: 9, scope: !94)
!105 = !DILocation(line: 71, column: 1, scope: !73)
!106 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 74, type: !15, scopeLine: 75, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!107 = !DILocalVariable(name: "data", scope: !106, file: !14, line: 76, type: !4)
!108 = !DILocation(line: 76, column: 12, scope: !106)
!109 = !DILocalVariable(name: "dataBuffer", scope: !106, file: !14, line: 77, type: !4)
!110 = !DILocation(line: 77, column: 12, scope: !106)
!111 = !DILocation(line: 77, column: 33, scope: !106)
!112 = !DILocation(line: 78, column: 12, scope: !106)
!113 = !DILocation(line: 78, column: 10, scope: !106)
!114 = !DILocation(line: 79, column: 8, scope: !115)
!115 = distinct !DILexicalBlock(scope: !106, file: !14, line: 79, column: 8)
!116 = !DILocation(line: 79, column: 25, scope: !115)
!117 = !DILocation(line: 79, column: 8, scope: !106)
!118 = !DILocation(line: 82, column: 16, scope: !119)
!119 = distinct !DILexicalBlock(scope: !115, file: !14, line: 80, column: 5)
!120 = !DILocation(line: 82, column: 9, scope: !119)
!121 = !DILocation(line: 83, column: 9, scope: !119)
!122 = !DILocation(line: 83, column: 20, scope: !119)
!123 = !DILocation(line: 84, column: 5, scope: !119)
!124 = !DILocalVariable(name: "dest", scope: !125, file: !14, line: 86, type: !36)
!125 = distinct !DILexicalBlock(scope: !106, file: !14, line: 85, column: 5)
!126 = !DILocation(line: 86, column: 14, scope: !125)
!127 = !DILocation(line: 88, column: 9, scope: !125)
!128 = !DILocation(line: 88, column: 23, scope: !125)
!129 = !DILocation(line: 88, column: 36, scope: !125)
!130 = !DILocation(line: 88, column: 29, scope: !125)
!131 = !DILocation(line: 88, column: 41, scope: !125)
!132 = !DILocation(line: 89, column: 9, scope: !125)
!133 = !DILocation(line: 89, column: 20, scope: !125)
!134 = !DILocation(line: 90, column: 19, scope: !125)
!135 = !DILocation(line: 90, column: 9, scope: !125)
!136 = !DILocation(line: 92, column: 1, scope: !106)

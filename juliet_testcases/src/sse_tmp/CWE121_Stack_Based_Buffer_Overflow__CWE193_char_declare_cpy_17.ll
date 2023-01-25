; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_17.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_17_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_17_bad() #0 !dbg !11 {
entry:
  %i = alloca i32, align 4
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %i, metadata !15, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !22, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !27, metadata !DIExpression()), !dbg !31
  store i32 0, i32* %i, align 4, !dbg !32
  br label %for.cond, !dbg !34

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !35
  %cmp = icmp slt i32 %0, 1, !dbg !37
  br i1 %cmp, label %for.body, label %for.end, !dbg !38

for.body:                                         ; preds = %for.cond
  %arraydecay = getelementptr inbounds [10 x i8], [10 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !39
  store i8* %arraydecay, i8** %data, align 8, !dbg !41
  %1 = load i8*, i8** %data, align 8, !dbg !42
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !42
  store i8 0, i8* %arrayidx, align 1, !dbg !43
  br label %for.inc, !dbg !44

for.inc:                                          ; preds = %for.body
  %2 = load i32, i32* %i, align 4, !dbg !45
  %inc = add nsw i32 %2, 1, !dbg !45
  store i32 %inc, i32* %i, align 4, !dbg !45
  br label %for.cond, !dbg !46, !llvm.loop !47

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !50, metadata !DIExpression()), !dbg !52
  %3 = bitcast [11 x i8]* %source to i8*, !dbg !52
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %3, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_17_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !52
  %4 = load i8*, i8** %data, align 8, !dbg !53
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !54
  %call = call i8* @strcpy(i8* %4, i8* %arraydecay1) #5, !dbg !55
  %5 = load i8*, i8** %data, align 8, !dbg !56
  call void @printLine(i8* %5), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_17_good() #0 !dbg !59 {
entry:
  call void @goodG2B(), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !62 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_17_good(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !76
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_17_bad(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !78
  ret i32 0, !dbg !79
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !80 {
entry:
  %h = alloca i32, align 4
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %h, metadata !81, metadata !DIExpression()), !dbg !82
  call void @llvm.dbg.declare(metadata i8** %data, metadata !83, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !85, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !87, metadata !DIExpression()), !dbg !88
  store i32 0, i32* %h, align 4, !dbg !89
  br label %for.cond, !dbg !91

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %h, align 4, !dbg !92
  %cmp = icmp slt i32 %0, 1, !dbg !94
  br i1 %cmp, label %for.body, label %for.end, !dbg !95

for.body:                                         ; preds = %for.cond
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !96
  store i8* %arraydecay, i8** %data, align 8, !dbg !98
  %1 = load i8*, i8** %data, align 8, !dbg !99
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !99
  store i8 0, i8* %arrayidx, align 1, !dbg !100
  br label %for.inc, !dbg !101

for.inc:                                          ; preds = %for.body
  %2 = load i32, i32* %h, align 4, !dbg !102
  %inc = add nsw i32 %2, 1, !dbg !102
  store i32 %inc, i32* %h, align 4, !dbg !102
  br label %for.cond, !dbg !103, !llvm.loop !104

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !106, metadata !DIExpression()), !dbg !108
  %3 = bitcast [11 x i8]* %source to i8*, !dbg !108
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %3, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B.source, i32 0, i32 0), i64 11, i1 false), !dbg !108
  %4 = load i8*, i8** %data, align 8, !dbg !109
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !110
  %call = call i8* @strcpy(i8* %4, i8* %arraydecay1) #5, !dbg !111
  %5 = load i8*, i8** %data, align 8, !dbg !112
  call void @printLine(i8* %5), !dbg !113
  ret void, !dbg !114
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_17.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_17_bad", scope: !12, file: !12, line: 28, type: !13, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_17.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "i", scope: !11, file: !12, line: 30, type: !16)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocation(line: 30, column: 9, scope: !11)
!18 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 31, type: !19)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!20 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!21 = !DILocation(line: 31, column: 12, scope: !11)
!22 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 32, type: !23)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 80, elements: !24)
!24 = !{!25}
!25 = !DISubrange(count: 10)
!26 = !DILocation(line: 32, column: 10, scope: !11)
!27 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 33, type: !28)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 88, elements: !29)
!29 = !{!30}
!30 = !DISubrange(count: 11)
!31 = !DILocation(line: 33, column: 10, scope: !11)
!32 = !DILocation(line: 34, column: 11, scope: !33)
!33 = distinct !DILexicalBlock(scope: !11, file: !12, line: 34, column: 5)
!34 = !DILocation(line: 34, column: 9, scope: !33)
!35 = !DILocation(line: 34, column: 16, scope: !36)
!36 = distinct !DILexicalBlock(scope: !33, file: !12, line: 34, column: 5)
!37 = !DILocation(line: 34, column: 18, scope: !36)
!38 = !DILocation(line: 34, column: 5, scope: !33)
!39 = !DILocation(line: 38, column: 16, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !12, line: 35, column: 5)
!41 = !DILocation(line: 38, column: 14, scope: !40)
!42 = !DILocation(line: 39, column: 9, scope: !40)
!43 = !DILocation(line: 39, column: 17, scope: !40)
!44 = !DILocation(line: 40, column: 5, scope: !40)
!45 = !DILocation(line: 34, column: 24, scope: !36)
!46 = !DILocation(line: 34, column: 5, scope: !36)
!47 = distinct !{!47, !38, !48, !49}
!48 = !DILocation(line: 40, column: 5, scope: !33)
!49 = !{!"llvm.loop.mustprogress"}
!50 = !DILocalVariable(name: "source", scope: !51, file: !12, line: 42, type: !28)
!51 = distinct !DILexicalBlock(scope: !11, file: !12, line: 41, column: 5)
!52 = !DILocation(line: 42, column: 14, scope: !51)
!53 = !DILocation(line: 44, column: 16, scope: !51)
!54 = !DILocation(line: 44, column: 22, scope: !51)
!55 = !DILocation(line: 44, column: 9, scope: !51)
!56 = !DILocation(line: 45, column: 19, scope: !51)
!57 = !DILocation(line: 45, column: 9, scope: !51)
!58 = !DILocation(line: 47, column: 1, scope: !11)
!59 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_17_good", scope: !12, file: !12, line: 75, type: !13, scopeLine: 76, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DILocation(line: 77, column: 5, scope: !59)
!61 = !DILocation(line: 78, column: 1, scope: !59)
!62 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 90, type: !63, scopeLine: 91, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DISubroutineType(types: !64)
!64 = !{!16, !16, !65}
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !19, size: 64)
!66 = !DILocalVariable(name: "argc", arg: 1, scope: !62, file: !12, line: 90, type: !16)
!67 = !DILocation(line: 90, column: 14, scope: !62)
!68 = !DILocalVariable(name: "argv", arg: 2, scope: !62, file: !12, line: 90, type: !65)
!69 = !DILocation(line: 90, column: 27, scope: !62)
!70 = !DILocation(line: 93, column: 22, scope: !62)
!71 = !DILocation(line: 93, column: 12, scope: !62)
!72 = !DILocation(line: 93, column: 5, scope: !62)
!73 = !DILocation(line: 95, column: 5, scope: !62)
!74 = !DILocation(line: 96, column: 5, scope: !62)
!75 = !DILocation(line: 97, column: 5, scope: !62)
!76 = !DILocation(line: 100, column: 5, scope: !62)
!77 = !DILocation(line: 101, column: 5, scope: !62)
!78 = !DILocation(line: 102, column: 5, scope: !62)
!79 = !DILocation(line: 104, column: 5, scope: !62)
!80 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 54, type: !13, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DILocalVariable(name: "h", scope: !80, file: !12, line: 56, type: !16)
!82 = !DILocation(line: 56, column: 9, scope: !80)
!83 = !DILocalVariable(name: "data", scope: !80, file: !12, line: 57, type: !19)
!84 = !DILocation(line: 57, column: 12, scope: !80)
!85 = !DILocalVariable(name: "dataBadBuffer", scope: !80, file: !12, line: 58, type: !23)
!86 = !DILocation(line: 58, column: 10, scope: !80)
!87 = !DILocalVariable(name: "dataGoodBuffer", scope: !80, file: !12, line: 59, type: !28)
!88 = !DILocation(line: 59, column: 10, scope: !80)
!89 = !DILocation(line: 60, column: 11, scope: !90)
!90 = distinct !DILexicalBlock(scope: !80, file: !12, line: 60, column: 5)
!91 = !DILocation(line: 60, column: 9, scope: !90)
!92 = !DILocation(line: 60, column: 16, scope: !93)
!93 = distinct !DILexicalBlock(scope: !90, file: !12, line: 60, column: 5)
!94 = !DILocation(line: 60, column: 18, scope: !93)
!95 = !DILocation(line: 60, column: 5, scope: !90)
!96 = !DILocation(line: 64, column: 16, scope: !97)
!97 = distinct !DILexicalBlock(scope: !93, file: !12, line: 61, column: 5)
!98 = !DILocation(line: 64, column: 14, scope: !97)
!99 = !DILocation(line: 65, column: 9, scope: !97)
!100 = !DILocation(line: 65, column: 17, scope: !97)
!101 = !DILocation(line: 66, column: 5, scope: !97)
!102 = !DILocation(line: 60, column: 24, scope: !93)
!103 = !DILocation(line: 60, column: 5, scope: !93)
!104 = distinct !{!104, !95, !105, !49}
!105 = !DILocation(line: 66, column: 5, scope: !90)
!106 = !DILocalVariable(name: "source", scope: !107, file: !12, line: 68, type: !28)
!107 = distinct !DILexicalBlock(scope: !80, file: !12, line: 67, column: 5)
!108 = !DILocation(line: 68, column: 14, scope: !107)
!109 = !DILocation(line: 70, column: 16, scope: !107)
!110 = !DILocation(line: 70, column: 22, scope: !107)
!111 = !DILocation(line: 70, column: 9, scope: !107)
!112 = !DILocation(line: 71, column: 19, scope: !107)
!113 = !DILocation(line: 71, column: 9, scope: !107)
!114 = !DILocation(line: 73, column: 1, scope: !80)

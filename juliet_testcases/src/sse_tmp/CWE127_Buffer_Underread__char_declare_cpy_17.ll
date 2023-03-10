; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__char_declare_cpy_17.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__char_declare_cpy_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_declare_cpy_17_bad() #0 !dbg !11 {
entry:
  %i = alloca i32, align 4
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [200 x i8], align 16
  call void @llvm.dbg.declare(metadata i32* %i, metadata !15, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !22, metadata !DIExpression()), !dbg !26
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !27
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !27
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !28
  store i8 0, i8* %arrayidx, align 1, !dbg !29
  store i32 0, i32* %i, align 4, !dbg !30
  br label %for.cond, !dbg !32

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !33
  %cmp = icmp slt i32 %0, 1, !dbg !35
  br i1 %cmp, label %for.body, label %for.end, !dbg !36

for.body:                                         ; preds = %for.cond
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !37
  %add.ptr = getelementptr inbounds i8, i8* %arraydecay1, i64 -8, !dbg !39
  store i8* %add.ptr, i8** %data, align 8, !dbg !40
  br label %for.inc, !dbg !41

for.inc:                                          ; preds = %for.body
  %1 = load i32, i32* %i, align 4, !dbg !42
  %inc = add nsw i32 %1, 1, !dbg !42
  store i32 %inc, i32* %i, align 4, !dbg !42
  br label %for.cond, !dbg !43, !llvm.loop !44

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [200 x i8]* %dest, metadata !47, metadata !DIExpression()), !dbg !52
  %arraydecay2 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !53
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 199, i1 false), !dbg !53
  %arrayidx3 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 199, !dbg !54
  store i8 0, i8* %arrayidx3, align 1, !dbg !55
  %arraydecay4 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !56
  %2 = load i8*, i8** %data, align 8, !dbg !57
  %call = call i8* @strcpy(i8* %arraydecay4, i8* %2) #5, !dbg !58
  %arraydecay5 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !59
  call void @printLine(i8* %arraydecay5), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_declare_cpy_17_good() #0 !dbg !62 {
entry:
  call void @goodG2B(), !dbg !63
  ret void, !dbg !64
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !65 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !69, metadata !DIExpression()), !dbg !70
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !71, metadata !DIExpression()), !dbg !72
  %call = call i64 @time(i64* null) #5, !dbg !73
  %conv = trunc i64 %call to i32, !dbg !74
  call void @srand(i32 %conv) #5, !dbg !75
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !76
  call void @CWE127_Buffer_Underread__char_declare_cpy_17_good(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !79
  call void @CWE127_Buffer_Underread__char_declare_cpy_17_bad(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !81
  ret i32 0, !dbg !82
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !83 {
entry:
  %h = alloca i32, align 4
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [200 x i8], align 16
  call void @llvm.dbg.declare(metadata i32* %h, metadata !84, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.declare(metadata i8** %data, metadata !86, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !88, metadata !DIExpression()), !dbg !89
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !90
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !90
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !91
  store i8 0, i8* %arrayidx, align 1, !dbg !92
  store i32 0, i32* %h, align 4, !dbg !93
  br label %for.cond, !dbg !95

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %h, align 4, !dbg !96
  %cmp = icmp slt i32 %0, 1, !dbg !98
  br i1 %cmp, label %for.body, label %for.end, !dbg !99

for.body:                                         ; preds = %for.cond
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !100
  store i8* %arraydecay1, i8** %data, align 8, !dbg !102
  br label %for.inc, !dbg !103

for.inc:                                          ; preds = %for.body
  %1 = load i32, i32* %h, align 4, !dbg !104
  %inc = add nsw i32 %1, 1, !dbg !104
  store i32 %inc, i32* %h, align 4, !dbg !104
  br label %for.cond, !dbg !105, !llvm.loop !106

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [200 x i8]* %dest, metadata !108, metadata !DIExpression()), !dbg !110
  %arraydecay2 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !111
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 199, i1 false), !dbg !111
  %arrayidx3 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 199, !dbg !112
  store i8 0, i8* %arrayidx3, align 1, !dbg !113
  %arraydecay4 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !114
  %2 = load i8*, i8** %data, align 8, !dbg !115
  %call = call i8* @strcpy(i8* %arraydecay4, i8* %2) #5, !dbg !116
  %arraydecay5 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !117
  call void @printLine(i8* %arraydecay5), !dbg !118
  ret void, !dbg !119
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__char_declare_cpy_17.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_declare_cpy_17_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__char_declare_cpy_17.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "i", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocation(line: 25, column: 9, scope: !11)
!18 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 26, type: !19)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!20 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!21 = !DILocation(line: 26, column: 12, scope: !11)
!22 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 27, type: !23)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 800, elements: !24)
!24 = !{!25}
!25 = !DISubrange(count: 100)
!26 = !DILocation(line: 27, column: 10, scope: !11)
!27 = !DILocation(line: 28, column: 5, scope: !11)
!28 = !DILocation(line: 29, column: 5, scope: !11)
!29 = !DILocation(line: 29, column: 23, scope: !11)
!30 = !DILocation(line: 30, column: 11, scope: !31)
!31 = distinct !DILexicalBlock(scope: !11, file: !12, line: 30, column: 5)
!32 = !DILocation(line: 30, column: 9, scope: !31)
!33 = !DILocation(line: 30, column: 16, scope: !34)
!34 = distinct !DILexicalBlock(scope: !31, file: !12, line: 30, column: 5)
!35 = !DILocation(line: 30, column: 18, scope: !34)
!36 = !DILocation(line: 30, column: 5, scope: !31)
!37 = !DILocation(line: 33, column: 16, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !12, line: 31, column: 5)
!39 = !DILocation(line: 33, column: 27, scope: !38)
!40 = !DILocation(line: 33, column: 14, scope: !38)
!41 = !DILocation(line: 34, column: 5, scope: !38)
!42 = !DILocation(line: 30, column: 24, scope: !34)
!43 = !DILocation(line: 30, column: 5, scope: !34)
!44 = distinct !{!44, !36, !45, !46}
!45 = !DILocation(line: 34, column: 5, scope: !31)
!46 = !{!"llvm.loop.mustprogress"}
!47 = !DILocalVariable(name: "dest", scope: !48, file: !12, line: 36, type: !49)
!48 = distinct !DILexicalBlock(scope: !11, file: !12, line: 35, column: 5)
!49 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 1600, elements: !50)
!50 = !{!51}
!51 = !DISubrange(count: 200)
!52 = !DILocation(line: 36, column: 14, scope: !48)
!53 = !DILocation(line: 37, column: 9, scope: !48)
!54 = !DILocation(line: 38, column: 9, scope: !48)
!55 = !DILocation(line: 38, column: 23, scope: !48)
!56 = !DILocation(line: 40, column: 16, scope: !48)
!57 = !DILocation(line: 40, column: 22, scope: !48)
!58 = !DILocation(line: 40, column: 9, scope: !48)
!59 = !DILocation(line: 41, column: 19, scope: !48)
!60 = !DILocation(line: 41, column: 9, scope: !48)
!61 = !DILocation(line: 43, column: 1, scope: !11)
!62 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_declare_cpy_17_good", scope: !12, file: !12, line: 72, type: !13, scopeLine: 73, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DILocation(line: 74, column: 5, scope: !62)
!64 = !DILocation(line: 75, column: 1, scope: !62)
!65 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 87, type: !66, scopeLine: 88, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DISubroutineType(types: !67)
!67 = !{!16, !16, !68}
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !19, size: 64)
!69 = !DILocalVariable(name: "argc", arg: 1, scope: !65, file: !12, line: 87, type: !16)
!70 = !DILocation(line: 87, column: 14, scope: !65)
!71 = !DILocalVariable(name: "argv", arg: 2, scope: !65, file: !12, line: 87, type: !68)
!72 = !DILocation(line: 87, column: 27, scope: !65)
!73 = !DILocation(line: 90, column: 22, scope: !65)
!74 = !DILocation(line: 90, column: 12, scope: !65)
!75 = !DILocation(line: 90, column: 5, scope: !65)
!76 = !DILocation(line: 92, column: 5, scope: !65)
!77 = !DILocation(line: 93, column: 5, scope: !65)
!78 = !DILocation(line: 94, column: 5, scope: !65)
!79 = !DILocation(line: 97, column: 5, scope: !65)
!80 = !DILocation(line: 98, column: 5, scope: !65)
!81 = !DILocation(line: 99, column: 5, scope: !65)
!82 = !DILocation(line: 101, column: 5, scope: !65)
!83 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 50, type: !13, scopeLine: 51, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DILocalVariable(name: "h", scope: !83, file: !12, line: 52, type: !16)
!85 = !DILocation(line: 52, column: 9, scope: !83)
!86 = !DILocalVariable(name: "data", scope: !83, file: !12, line: 53, type: !19)
!87 = !DILocation(line: 53, column: 12, scope: !83)
!88 = !DILocalVariable(name: "dataBuffer", scope: !83, file: !12, line: 54, type: !23)
!89 = !DILocation(line: 54, column: 10, scope: !83)
!90 = !DILocation(line: 55, column: 5, scope: !83)
!91 = !DILocation(line: 56, column: 5, scope: !83)
!92 = !DILocation(line: 56, column: 23, scope: !83)
!93 = !DILocation(line: 57, column: 11, scope: !94)
!94 = distinct !DILexicalBlock(scope: !83, file: !12, line: 57, column: 5)
!95 = !DILocation(line: 57, column: 9, scope: !94)
!96 = !DILocation(line: 57, column: 16, scope: !97)
!97 = distinct !DILexicalBlock(scope: !94, file: !12, line: 57, column: 5)
!98 = !DILocation(line: 57, column: 18, scope: !97)
!99 = !DILocation(line: 57, column: 5, scope: !94)
!100 = !DILocation(line: 60, column: 16, scope: !101)
!101 = distinct !DILexicalBlock(scope: !97, file: !12, line: 58, column: 5)
!102 = !DILocation(line: 60, column: 14, scope: !101)
!103 = !DILocation(line: 61, column: 5, scope: !101)
!104 = !DILocation(line: 57, column: 24, scope: !97)
!105 = !DILocation(line: 57, column: 5, scope: !97)
!106 = distinct !{!106, !99, !107, !46}
!107 = !DILocation(line: 61, column: 5, scope: !94)
!108 = !DILocalVariable(name: "dest", scope: !109, file: !12, line: 63, type: !49)
!109 = distinct !DILexicalBlock(scope: !83, file: !12, line: 62, column: 5)
!110 = !DILocation(line: 63, column: 14, scope: !109)
!111 = !DILocation(line: 64, column: 9, scope: !109)
!112 = !DILocation(line: 65, column: 9, scope: !109)
!113 = !DILocation(line: 65, column: 23, scope: !109)
!114 = !DILocation(line: 67, column: 16, scope: !109)
!115 = !DILocation(line: 67, column: 22, scope: !109)
!116 = !DILocation(line: 67, column: 9, scope: !109)
!117 = !DILocation(line: 68, column: 19, scope: !109)
!118 = !DILocation(line: 68, column: 9, scope: !109)
!119 = !DILocation(line: 70, column: 1, scope: !83)

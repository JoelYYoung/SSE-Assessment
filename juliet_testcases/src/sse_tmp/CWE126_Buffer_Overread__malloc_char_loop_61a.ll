; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_61a.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_61a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_char_loop_61_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  store i8* null, i8** %data, align 8, !dbg !19
  %0 = load i8*, i8** %data, align 8, !dbg !20
  %call = call i8* @CWE126_Buffer_Overread__malloc_char_loop_61b_badSource(i8* %0), !dbg !21
  store i8* %call, i8** %data, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i64* %i, metadata !23, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !29, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !31, metadata !DIExpression()), !dbg !35
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !36
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !36
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !37
  store i8 0, i8* %arrayidx, align 1, !dbg !38
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !39
  %call2 = call i64 @strlen(i8* %arraydecay1) #6, !dbg !40
  store i64 %call2, i64* %destLen, align 8, !dbg !41
  store i64 0, i64* %i, align 8, !dbg !42
  br label %for.cond, !dbg !44

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !45
  %2 = load i64, i64* %destLen, align 8, !dbg !47
  %cmp = icmp ult i64 %1, %2, !dbg !48
  br i1 %cmp, label %for.body, label %for.end, !dbg !49

for.body:                                         ; preds = %for.cond
  %3 = load i8*, i8** %data, align 8, !dbg !50
  %4 = load i64, i64* %i, align 8, !dbg !52
  %arrayidx3 = getelementptr inbounds i8, i8* %3, i64 %4, !dbg !50
  %5 = load i8, i8* %arrayidx3, align 1, !dbg !50
  %6 = load i64, i64* %i, align 8, !dbg !53
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %6, !dbg !54
  store i8 %5, i8* %arrayidx4, align 1, !dbg !55
  br label %for.inc, !dbg !56

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !57
  %inc = add i64 %7, 1, !dbg !57
  store i64 %inc, i64* %i, align 8, !dbg !57
  br label %for.cond, !dbg !58, !llvm.loop !59

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !62
  store i8 0, i8* %arrayidx5, align 1, !dbg !63
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !64
  call void @printLine(i8* %arraydecay6), !dbg !65
  %8 = load i8*, i8** %data, align 8, !dbg !66
  call void @free(i8* %8) #7, !dbg !67
  ret void, !dbg !68
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i8* @CWE126_Buffer_Overread__malloc_char_loop_61b_badSource(i8*) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #4

declare dso_local void @printLine(i8*) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_char_loop_61_good() #0 !dbg !69 {
entry:
  call void @goodG2B(), !dbg !70
  ret void, !dbg !71
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !72 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !77, metadata !DIExpression()), !dbg !78
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !79, metadata !DIExpression()), !dbg !80
  %call = call i64 @time(i64* null) #7, !dbg !81
  %conv = trunc i64 %call to i32, !dbg !82
  call void @srand(i32 %conv) #7, !dbg !83
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !84
  call void @CWE126_Buffer_Overread__malloc_char_loop_61_good(), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !87
  call void @CWE126_Buffer_Overread__malloc_char_loop_61_bad(), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !89
  ret i32 0, !dbg !90
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !91 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !92, metadata !DIExpression()), !dbg !93
  store i8* null, i8** %data, align 8, !dbg !94
  %0 = load i8*, i8** %data, align 8, !dbg !95
  %call = call i8* @CWE126_Buffer_Overread__malloc_char_loop_61b_goodG2BSource(i8* %0), !dbg !96
  store i8* %call, i8** %data, align 8, !dbg !97
  call void @llvm.dbg.declare(metadata i64* %i, metadata !98, metadata !DIExpression()), !dbg !100
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !101, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !103, metadata !DIExpression()), !dbg !104
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !105
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !105
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !106
  store i8 0, i8* %arrayidx, align 1, !dbg !107
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !108
  %call2 = call i64 @strlen(i8* %arraydecay1) #6, !dbg !109
  store i64 %call2, i64* %destLen, align 8, !dbg !110
  store i64 0, i64* %i, align 8, !dbg !111
  br label %for.cond, !dbg !113

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !114
  %2 = load i64, i64* %destLen, align 8, !dbg !116
  %cmp = icmp ult i64 %1, %2, !dbg !117
  br i1 %cmp, label %for.body, label %for.end, !dbg !118

for.body:                                         ; preds = %for.cond
  %3 = load i8*, i8** %data, align 8, !dbg !119
  %4 = load i64, i64* %i, align 8, !dbg !121
  %arrayidx3 = getelementptr inbounds i8, i8* %3, i64 %4, !dbg !119
  %5 = load i8, i8* %arrayidx3, align 1, !dbg !119
  %6 = load i64, i64* %i, align 8, !dbg !122
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %6, !dbg !123
  store i8 %5, i8* %arrayidx4, align 1, !dbg !124
  br label %for.inc, !dbg !125

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !126
  %inc = add i64 %7, 1, !dbg !126
  store i64 %inc, i64* %i, align 8, !dbg !126
  br label %for.cond, !dbg !127, !llvm.loop !128

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !130
  store i8 0, i8* %arrayidx5, align 1, !dbg !131
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !132
  call void @printLine(i8* %arraydecay6), !dbg !133
  %8 = load i8*, i8** %data, align 8, !dbg !134
  call void @free(i8* %8) #7, !dbg !135
  ret void, !dbg !136
}

declare dso_local i8* @CWE126_Buffer_Overread__malloc_char_loop_61b_goodG2BSource(i8*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_61a.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_loop_61_bad", scope: !12, file: !12, line: 26, type: !13, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_61a.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 28, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 28, column: 12, scope: !11)
!19 = !DILocation(line: 29, column: 10, scope: !11)
!20 = !DILocation(line: 30, column: 67, scope: !11)
!21 = !DILocation(line: 30, column: 12, scope: !11)
!22 = !DILocation(line: 30, column: 10, scope: !11)
!23 = !DILocalVariable(name: "i", scope: !24, file: !12, line: 32, type: !25)
!24 = distinct !DILexicalBlock(scope: !11, file: !12, line: 31, column: 5)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !26, line: 46, baseType: !27)
!26 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!27 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!28 = !DILocation(line: 32, column: 16, scope: !24)
!29 = !DILocalVariable(name: "destLen", scope: !24, file: !12, line: 32, type: !25)
!30 = !DILocation(line: 32, column: 19, scope: !24)
!31 = !DILocalVariable(name: "dest", scope: !24, file: !12, line: 33, type: !32)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 800, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 100)
!35 = !DILocation(line: 33, column: 14, scope: !24)
!36 = !DILocation(line: 34, column: 9, scope: !24)
!37 = !DILocation(line: 35, column: 9, scope: !24)
!38 = !DILocation(line: 35, column: 21, scope: !24)
!39 = !DILocation(line: 36, column: 26, scope: !24)
!40 = !DILocation(line: 36, column: 19, scope: !24)
!41 = !DILocation(line: 36, column: 17, scope: !24)
!42 = !DILocation(line: 39, column: 16, scope: !43)
!43 = distinct !DILexicalBlock(scope: !24, file: !12, line: 39, column: 9)
!44 = !DILocation(line: 39, column: 14, scope: !43)
!45 = !DILocation(line: 39, column: 21, scope: !46)
!46 = distinct !DILexicalBlock(scope: !43, file: !12, line: 39, column: 9)
!47 = !DILocation(line: 39, column: 25, scope: !46)
!48 = !DILocation(line: 39, column: 23, scope: !46)
!49 = !DILocation(line: 39, column: 9, scope: !43)
!50 = !DILocation(line: 41, column: 23, scope: !51)
!51 = distinct !DILexicalBlock(scope: !46, file: !12, line: 40, column: 9)
!52 = !DILocation(line: 41, column: 28, scope: !51)
!53 = !DILocation(line: 41, column: 18, scope: !51)
!54 = !DILocation(line: 41, column: 13, scope: !51)
!55 = !DILocation(line: 41, column: 21, scope: !51)
!56 = !DILocation(line: 42, column: 9, scope: !51)
!57 = !DILocation(line: 39, column: 35, scope: !46)
!58 = !DILocation(line: 39, column: 9, scope: !46)
!59 = distinct !{!59, !49, !60, !61}
!60 = !DILocation(line: 42, column: 9, scope: !43)
!61 = !{!"llvm.loop.mustprogress"}
!62 = !DILocation(line: 43, column: 9, scope: !24)
!63 = !DILocation(line: 43, column: 21, scope: !24)
!64 = !DILocation(line: 44, column: 19, scope: !24)
!65 = !DILocation(line: 44, column: 9, scope: !24)
!66 = !DILocation(line: 45, column: 14, scope: !24)
!67 = !DILocation(line: 45, column: 9, scope: !24)
!68 = !DILocation(line: 47, column: 1, scope: !11)
!69 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_loop_61_good", scope: !12, file: !12, line: 79, type: !13, scopeLine: 80, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DILocation(line: 81, column: 5, scope: !69)
!71 = !DILocation(line: 82, column: 1, scope: !69)
!72 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 94, type: !73, scopeLine: 95, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DISubroutineType(types: !74)
!74 = !{!75, !75, !76}
!75 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!77 = !DILocalVariable(name: "argc", arg: 1, scope: !72, file: !12, line: 94, type: !75)
!78 = !DILocation(line: 94, column: 14, scope: !72)
!79 = !DILocalVariable(name: "argv", arg: 2, scope: !72, file: !12, line: 94, type: !76)
!80 = !DILocation(line: 94, column: 27, scope: !72)
!81 = !DILocation(line: 97, column: 22, scope: !72)
!82 = !DILocation(line: 97, column: 12, scope: !72)
!83 = !DILocation(line: 97, column: 5, scope: !72)
!84 = !DILocation(line: 99, column: 5, scope: !72)
!85 = !DILocation(line: 100, column: 5, scope: !72)
!86 = !DILocation(line: 101, column: 5, scope: !72)
!87 = !DILocation(line: 104, column: 5, scope: !72)
!88 = !DILocation(line: 105, column: 5, scope: !72)
!89 = !DILocation(line: 106, column: 5, scope: !72)
!90 = !DILocation(line: 108, column: 5, scope: !72)
!91 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 56, type: !13, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!92 = !DILocalVariable(name: "data", scope: !91, file: !12, line: 58, type: !16)
!93 = !DILocation(line: 58, column: 12, scope: !91)
!94 = !DILocation(line: 59, column: 10, scope: !91)
!95 = !DILocation(line: 60, column: 71, scope: !91)
!96 = !DILocation(line: 60, column: 12, scope: !91)
!97 = !DILocation(line: 60, column: 10, scope: !91)
!98 = !DILocalVariable(name: "i", scope: !99, file: !12, line: 62, type: !25)
!99 = distinct !DILexicalBlock(scope: !91, file: !12, line: 61, column: 5)
!100 = !DILocation(line: 62, column: 16, scope: !99)
!101 = !DILocalVariable(name: "destLen", scope: !99, file: !12, line: 62, type: !25)
!102 = !DILocation(line: 62, column: 19, scope: !99)
!103 = !DILocalVariable(name: "dest", scope: !99, file: !12, line: 63, type: !32)
!104 = !DILocation(line: 63, column: 14, scope: !99)
!105 = !DILocation(line: 64, column: 9, scope: !99)
!106 = !DILocation(line: 65, column: 9, scope: !99)
!107 = !DILocation(line: 65, column: 21, scope: !99)
!108 = !DILocation(line: 66, column: 26, scope: !99)
!109 = !DILocation(line: 66, column: 19, scope: !99)
!110 = !DILocation(line: 66, column: 17, scope: !99)
!111 = !DILocation(line: 69, column: 16, scope: !112)
!112 = distinct !DILexicalBlock(scope: !99, file: !12, line: 69, column: 9)
!113 = !DILocation(line: 69, column: 14, scope: !112)
!114 = !DILocation(line: 69, column: 21, scope: !115)
!115 = distinct !DILexicalBlock(scope: !112, file: !12, line: 69, column: 9)
!116 = !DILocation(line: 69, column: 25, scope: !115)
!117 = !DILocation(line: 69, column: 23, scope: !115)
!118 = !DILocation(line: 69, column: 9, scope: !112)
!119 = !DILocation(line: 71, column: 23, scope: !120)
!120 = distinct !DILexicalBlock(scope: !115, file: !12, line: 70, column: 9)
!121 = !DILocation(line: 71, column: 28, scope: !120)
!122 = !DILocation(line: 71, column: 18, scope: !120)
!123 = !DILocation(line: 71, column: 13, scope: !120)
!124 = !DILocation(line: 71, column: 21, scope: !120)
!125 = !DILocation(line: 72, column: 9, scope: !120)
!126 = !DILocation(line: 69, column: 35, scope: !115)
!127 = !DILocation(line: 69, column: 9, scope: !115)
!128 = distinct !{!128, !118, !129, !61}
!129 = !DILocation(line: 72, column: 9, scope: !112)
!130 = !DILocation(line: 73, column: 9, scope: !99)
!131 = !DILocation(line: 73, column: 21, scope: !99)
!132 = !DILocation(line: 74, column: 19, scope: !99)
!133 = !DILocation(line: 74, column: 9, scope: !99)
!134 = !DILocation(line: 75, column: 14, scope: !99)
!135 = !DILocation(line: 75, column: 9, scope: !99)
!136 = !DILocation(line: 77, column: 1, scope: !91)

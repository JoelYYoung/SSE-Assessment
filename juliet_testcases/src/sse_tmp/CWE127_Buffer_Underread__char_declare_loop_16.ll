; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__char_declare_loop_16.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__char_declare_loop_16.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_declare_loop_16_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %i = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !19, metadata !DIExpression()), !dbg !23
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !24
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !24
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !25
  store i8 0, i8* %arrayidx, align 1, !dbg !26
  br label %while.body, !dbg !27

while.body:                                       ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !28
  %add.ptr = getelementptr inbounds i8, i8* %arraydecay1, i64 -8, !dbg !30
  store i8* %add.ptr, i8** %data, align 8, !dbg !31
  br label %while.end, !dbg !32

while.end:                                        ; preds = %while.body
  call void @llvm.dbg.declare(metadata i64* %i, metadata !33, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !39, metadata !DIExpression()), !dbg !40
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !41
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 99, i1 false), !dbg !41
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !42
  store i8 0, i8* %arrayidx3, align 1, !dbg !43
  store i64 0, i64* %i, align 8, !dbg !44
  br label %for.cond, !dbg !46

for.cond:                                         ; preds = %for.inc, %while.end
  %0 = load i64, i64* %i, align 8, !dbg !47
  %cmp = icmp ult i64 %0, 100, !dbg !49
  br i1 %cmp, label %for.body, label %for.end, !dbg !50

for.body:                                         ; preds = %for.cond
  %1 = load i8*, i8** %data, align 8, !dbg !51
  %2 = load i64, i64* %i, align 8, !dbg !53
  %arrayidx4 = getelementptr inbounds i8, i8* %1, i64 %2, !dbg !51
  %3 = load i8, i8* %arrayidx4, align 1, !dbg !51
  %4 = load i64, i64* %i, align 8, !dbg !54
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %4, !dbg !55
  store i8 %3, i8* %arrayidx5, align 1, !dbg !56
  br label %for.inc, !dbg !57

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !58
  %inc = add i64 %5, 1, !dbg !58
  store i64 %inc, i64* %i, align 8, !dbg !58
  br label %for.cond, !dbg !59, !llvm.loop !60

for.end:                                          ; preds = %for.cond
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !63
  store i8 0, i8* %arrayidx6, align 1, !dbg !64
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !65
  call void @printLine(i8* %arraydecay7), !dbg !66
  ret void, !dbg !67
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_declare_loop_16_good() #0 !dbg !68 {
entry:
  call void @goodG2B(), !dbg !69
  ret void, !dbg !70
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !71 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !76, metadata !DIExpression()), !dbg !77
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !78, metadata !DIExpression()), !dbg !79
  %call = call i64 @time(i64* null) #5, !dbg !80
  %conv = trunc i64 %call to i32, !dbg !81
  call void @srand(i32 %conv) #5, !dbg !82
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !83
  call void @CWE127_Buffer_Underread__char_declare_loop_16_good(), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !86
  call void @CWE127_Buffer_Underread__char_declare_loop_16_bad(), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !88
  ret i32 0, !dbg !89
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !90 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %i = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !91, metadata !DIExpression()), !dbg !92
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !93, metadata !DIExpression()), !dbg !94
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !95
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !95
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !96
  store i8 0, i8* %arrayidx, align 1, !dbg !97
  br label %while.body, !dbg !98

while.body:                                       ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !99
  store i8* %arraydecay1, i8** %data, align 8, !dbg !101
  br label %while.end, !dbg !102

while.end:                                        ; preds = %while.body
  call void @llvm.dbg.declare(metadata i64* %i, metadata !103, metadata !DIExpression()), !dbg !105
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !106, metadata !DIExpression()), !dbg !107
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !108
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 99, i1 false), !dbg !108
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !109
  store i8 0, i8* %arrayidx3, align 1, !dbg !110
  store i64 0, i64* %i, align 8, !dbg !111
  br label %for.cond, !dbg !113

for.cond:                                         ; preds = %for.inc, %while.end
  %0 = load i64, i64* %i, align 8, !dbg !114
  %cmp = icmp ult i64 %0, 100, !dbg !116
  br i1 %cmp, label %for.body, label %for.end, !dbg !117

for.body:                                         ; preds = %for.cond
  %1 = load i8*, i8** %data, align 8, !dbg !118
  %2 = load i64, i64* %i, align 8, !dbg !120
  %arrayidx4 = getelementptr inbounds i8, i8* %1, i64 %2, !dbg !118
  %3 = load i8, i8* %arrayidx4, align 1, !dbg !118
  %4 = load i64, i64* %i, align 8, !dbg !121
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %4, !dbg !122
  store i8 %3, i8* %arrayidx5, align 1, !dbg !123
  br label %for.inc, !dbg !124

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !125
  %inc = add i64 %5, 1, !dbg !125
  store i64 %inc, i64* %i, align 8, !dbg !125
  br label %for.cond, !dbg !126, !llvm.loop !127

for.end:                                          ; preds = %for.cond
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !129
  store i8 0, i8* %arrayidx6, align 1, !dbg !130
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !131
  call void @printLine(i8* %arraydecay7), !dbg !132
  ret void, !dbg !133
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__char_declare_loop_16.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_declare_loop_16_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__char_declare_loop_16.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 25, column: 12, scope: !11)
!19 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 26, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 800, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 100)
!23 = !DILocation(line: 26, column: 10, scope: !11)
!24 = !DILocation(line: 27, column: 5, scope: !11)
!25 = !DILocation(line: 28, column: 5, scope: !11)
!26 = !DILocation(line: 28, column: 23, scope: !11)
!27 = !DILocation(line: 29, column: 5, scope: !11)
!28 = !DILocation(line: 32, column: 16, scope: !29)
!29 = distinct !DILexicalBlock(scope: !11, file: !12, line: 30, column: 5)
!30 = !DILocation(line: 32, column: 27, scope: !29)
!31 = !DILocation(line: 32, column: 14, scope: !29)
!32 = !DILocation(line: 33, column: 9, scope: !29)
!33 = !DILocalVariable(name: "i", scope: !34, file: !12, line: 36, type: !35)
!34 = distinct !DILexicalBlock(scope: !11, file: !12, line: 35, column: 5)
!35 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !36, line: 46, baseType: !37)
!36 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!37 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!38 = !DILocation(line: 36, column: 16, scope: !34)
!39 = !DILocalVariable(name: "dest", scope: !34, file: !12, line: 37, type: !20)
!40 = !DILocation(line: 37, column: 14, scope: !34)
!41 = !DILocation(line: 38, column: 9, scope: !34)
!42 = !DILocation(line: 39, column: 9, scope: !34)
!43 = !DILocation(line: 39, column: 21, scope: !34)
!44 = !DILocation(line: 41, column: 16, scope: !45)
!45 = distinct !DILexicalBlock(scope: !34, file: !12, line: 41, column: 9)
!46 = !DILocation(line: 41, column: 14, scope: !45)
!47 = !DILocation(line: 41, column: 21, scope: !48)
!48 = distinct !DILexicalBlock(scope: !45, file: !12, line: 41, column: 9)
!49 = !DILocation(line: 41, column: 23, scope: !48)
!50 = !DILocation(line: 41, column: 9, scope: !45)
!51 = !DILocation(line: 43, column: 23, scope: !52)
!52 = distinct !DILexicalBlock(scope: !48, file: !12, line: 42, column: 9)
!53 = !DILocation(line: 43, column: 28, scope: !52)
!54 = !DILocation(line: 43, column: 18, scope: !52)
!55 = !DILocation(line: 43, column: 13, scope: !52)
!56 = !DILocation(line: 43, column: 21, scope: !52)
!57 = !DILocation(line: 44, column: 9, scope: !52)
!58 = !DILocation(line: 41, column: 31, scope: !48)
!59 = !DILocation(line: 41, column: 9, scope: !48)
!60 = distinct !{!60, !50, !61, !62}
!61 = !DILocation(line: 44, column: 9, scope: !45)
!62 = !{!"llvm.loop.mustprogress"}
!63 = !DILocation(line: 46, column: 9, scope: !34)
!64 = !DILocation(line: 46, column: 21, scope: !34)
!65 = !DILocation(line: 47, column: 19, scope: !34)
!66 = !DILocation(line: 47, column: 9, scope: !34)
!67 = !DILocation(line: 49, column: 1, scope: !11)
!68 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_declare_loop_16_good", scope: !12, file: !12, line: 84, type: !13, scopeLine: 85, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DILocation(line: 86, column: 5, scope: !68)
!70 = !DILocation(line: 87, column: 1, scope: !68)
!71 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 99, type: !72, scopeLine: 100, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DISubroutineType(types: !73)
!73 = !{!74, !74, !75}
!74 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!76 = !DILocalVariable(name: "argc", arg: 1, scope: !71, file: !12, line: 99, type: !74)
!77 = !DILocation(line: 99, column: 14, scope: !71)
!78 = !DILocalVariable(name: "argv", arg: 2, scope: !71, file: !12, line: 99, type: !75)
!79 = !DILocation(line: 99, column: 27, scope: !71)
!80 = !DILocation(line: 102, column: 22, scope: !71)
!81 = !DILocation(line: 102, column: 12, scope: !71)
!82 = !DILocation(line: 102, column: 5, scope: !71)
!83 = !DILocation(line: 104, column: 5, scope: !71)
!84 = !DILocation(line: 105, column: 5, scope: !71)
!85 = !DILocation(line: 106, column: 5, scope: !71)
!86 = !DILocation(line: 109, column: 5, scope: !71)
!87 = !DILocation(line: 110, column: 5, scope: !71)
!88 = !DILocation(line: 111, column: 5, scope: !71)
!89 = !DILocation(line: 113, column: 5, scope: !71)
!90 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 56, type: !13, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!91 = !DILocalVariable(name: "data", scope: !90, file: !12, line: 58, type: !16)
!92 = !DILocation(line: 58, column: 12, scope: !90)
!93 = !DILocalVariable(name: "dataBuffer", scope: !90, file: !12, line: 59, type: !20)
!94 = !DILocation(line: 59, column: 10, scope: !90)
!95 = !DILocation(line: 60, column: 5, scope: !90)
!96 = !DILocation(line: 61, column: 5, scope: !90)
!97 = !DILocation(line: 61, column: 23, scope: !90)
!98 = !DILocation(line: 62, column: 5, scope: !90)
!99 = !DILocation(line: 65, column: 16, scope: !100)
!100 = distinct !DILexicalBlock(scope: !90, file: !12, line: 63, column: 5)
!101 = !DILocation(line: 65, column: 14, scope: !100)
!102 = !DILocation(line: 66, column: 9, scope: !100)
!103 = !DILocalVariable(name: "i", scope: !104, file: !12, line: 69, type: !35)
!104 = distinct !DILexicalBlock(scope: !90, file: !12, line: 68, column: 5)
!105 = !DILocation(line: 69, column: 16, scope: !104)
!106 = !DILocalVariable(name: "dest", scope: !104, file: !12, line: 70, type: !20)
!107 = !DILocation(line: 70, column: 14, scope: !104)
!108 = !DILocation(line: 71, column: 9, scope: !104)
!109 = !DILocation(line: 72, column: 9, scope: !104)
!110 = !DILocation(line: 72, column: 21, scope: !104)
!111 = !DILocation(line: 74, column: 16, scope: !112)
!112 = distinct !DILexicalBlock(scope: !104, file: !12, line: 74, column: 9)
!113 = !DILocation(line: 74, column: 14, scope: !112)
!114 = !DILocation(line: 74, column: 21, scope: !115)
!115 = distinct !DILexicalBlock(scope: !112, file: !12, line: 74, column: 9)
!116 = !DILocation(line: 74, column: 23, scope: !115)
!117 = !DILocation(line: 74, column: 9, scope: !112)
!118 = !DILocation(line: 76, column: 23, scope: !119)
!119 = distinct !DILexicalBlock(scope: !115, file: !12, line: 75, column: 9)
!120 = !DILocation(line: 76, column: 28, scope: !119)
!121 = !DILocation(line: 76, column: 18, scope: !119)
!122 = !DILocation(line: 76, column: 13, scope: !119)
!123 = !DILocation(line: 76, column: 21, scope: !119)
!124 = !DILocation(line: 77, column: 9, scope: !119)
!125 = !DILocation(line: 74, column: 31, scope: !115)
!126 = !DILocation(line: 74, column: 9, scope: !115)
!127 = distinct !{!127, !117, !128, !62}
!128 = !DILocation(line: 77, column: 9, scope: !112)
!129 = !DILocation(line: 79, column: 9, scope: !104)
!130 = !DILocation(line: 79, column: 21, scope: !104)
!131 = !DILocation(line: 80, column: 19, scope: !104)
!132 = !DILocation(line: 80, column: 9, scope: !104)
!133 = !DILocation(line: 82, column: 1, scope: !90)

; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__char_declare_loop_01.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__char_declare_loop_01.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_declare_loop_01_bad() #0 !dbg !11 {
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
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !27
  %add.ptr = getelementptr inbounds i8, i8* %arraydecay1, i64 -8, !dbg !28
  store i8* %add.ptr, i8** %data, align 8, !dbg !29
  call void @llvm.dbg.declare(metadata i64* %i, metadata !30, metadata !DIExpression()), !dbg !35
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !36, metadata !DIExpression()), !dbg !37
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !38
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 99, i1 false), !dbg !38
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !39
  store i8 0, i8* %arrayidx3, align 1, !dbg !40
  store i64 0, i64* %i, align 8, !dbg !41
  br label %for.cond, !dbg !43

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !44
  %cmp = icmp ult i64 %0, 100, !dbg !46
  br i1 %cmp, label %for.body, label %for.end, !dbg !47

for.body:                                         ; preds = %for.cond
  %1 = load i8*, i8** %data, align 8, !dbg !48
  %2 = load i64, i64* %i, align 8, !dbg !50
  %arrayidx4 = getelementptr inbounds i8, i8* %1, i64 %2, !dbg !48
  %3 = load i8, i8* %arrayidx4, align 1, !dbg !48
  %4 = load i64, i64* %i, align 8, !dbg !51
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %4, !dbg !52
  store i8 %3, i8* %arrayidx5, align 1, !dbg !53
  br label %for.inc, !dbg !54

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !55
  %inc = add i64 %5, 1, !dbg !55
  store i64 %inc, i64* %i, align 8, !dbg !55
  br label %for.cond, !dbg !56, !llvm.loop !57

for.end:                                          ; preds = %for.cond
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !60
  store i8 0, i8* %arrayidx6, align 1, !dbg !61
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !62
  call void @printLine(i8* %arraydecay7), !dbg !63
  ret void, !dbg !64
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_declare_loop_01_good() #0 !dbg !65 {
entry:
  call void @goodG2B(), !dbg !66
  ret void, !dbg !67
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !68 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !73, metadata !DIExpression()), !dbg !74
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !75, metadata !DIExpression()), !dbg !76
  %call = call i64 @time(i64* null) #5, !dbg !77
  %conv = trunc i64 %call to i32, !dbg !78
  call void @srand(i32 %conv) #5, !dbg !79
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !80
  call void @CWE127_Buffer_Underread__char_declare_loop_01_good(), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !83
  call void @CWE127_Buffer_Underread__char_declare_loop_01_bad(), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !85
  ret i32 0, !dbg !86
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !87 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %i = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !88, metadata !DIExpression()), !dbg !89
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !90, metadata !DIExpression()), !dbg !91
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !92
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !92
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !93
  store i8 0, i8* %arrayidx, align 1, !dbg !94
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !95
  store i8* %arraydecay1, i8** %data, align 8, !dbg !96
  call void @llvm.dbg.declare(metadata i64* %i, metadata !97, metadata !DIExpression()), !dbg !99
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !100, metadata !DIExpression()), !dbg !101
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !102
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 99, i1 false), !dbg !102
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !103
  store i8 0, i8* %arrayidx3, align 1, !dbg !104
  store i64 0, i64* %i, align 8, !dbg !105
  br label %for.cond, !dbg !107

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !108
  %cmp = icmp ult i64 %0, 100, !dbg !110
  br i1 %cmp, label %for.body, label %for.end, !dbg !111

for.body:                                         ; preds = %for.cond
  %1 = load i8*, i8** %data, align 8, !dbg !112
  %2 = load i64, i64* %i, align 8, !dbg !114
  %arrayidx4 = getelementptr inbounds i8, i8* %1, i64 %2, !dbg !112
  %3 = load i8, i8* %arrayidx4, align 1, !dbg !112
  %4 = load i64, i64* %i, align 8, !dbg !115
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %4, !dbg !116
  store i8 %3, i8* %arrayidx5, align 1, !dbg !117
  br label %for.inc, !dbg !118

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !119
  %inc = add i64 %5, 1, !dbg !119
  store i64 %inc, i64* %i, align 8, !dbg !119
  br label %for.cond, !dbg !120, !llvm.loop !121

for.end:                                          ; preds = %for.cond
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !123
  store i8 0, i8* %arrayidx6, align 1, !dbg !124
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !125
  call void @printLine(i8* %arraydecay7), !dbg !126
  ret void, !dbg !127
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__char_declare_loop_01.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_declare_loop_01_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__char_declare_loop_01.c", directory: "/home/joelyang/SSE-Assessment")
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
!27 = !DILocation(line: 30, column: 12, scope: !11)
!28 = !DILocation(line: 30, column: 23, scope: !11)
!29 = !DILocation(line: 30, column: 10, scope: !11)
!30 = !DILocalVariable(name: "i", scope: !31, file: !12, line: 32, type: !32)
!31 = distinct !DILexicalBlock(scope: !11, file: !12, line: 31, column: 5)
!32 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !33, line: 46, baseType: !34)
!33 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!34 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!35 = !DILocation(line: 32, column: 16, scope: !31)
!36 = !DILocalVariable(name: "dest", scope: !31, file: !12, line: 33, type: !20)
!37 = !DILocation(line: 33, column: 14, scope: !31)
!38 = !DILocation(line: 34, column: 9, scope: !31)
!39 = !DILocation(line: 35, column: 9, scope: !31)
!40 = !DILocation(line: 35, column: 21, scope: !31)
!41 = !DILocation(line: 37, column: 16, scope: !42)
!42 = distinct !DILexicalBlock(scope: !31, file: !12, line: 37, column: 9)
!43 = !DILocation(line: 37, column: 14, scope: !42)
!44 = !DILocation(line: 37, column: 21, scope: !45)
!45 = distinct !DILexicalBlock(scope: !42, file: !12, line: 37, column: 9)
!46 = !DILocation(line: 37, column: 23, scope: !45)
!47 = !DILocation(line: 37, column: 9, scope: !42)
!48 = !DILocation(line: 39, column: 23, scope: !49)
!49 = distinct !DILexicalBlock(scope: !45, file: !12, line: 38, column: 9)
!50 = !DILocation(line: 39, column: 28, scope: !49)
!51 = !DILocation(line: 39, column: 18, scope: !49)
!52 = !DILocation(line: 39, column: 13, scope: !49)
!53 = !DILocation(line: 39, column: 21, scope: !49)
!54 = !DILocation(line: 40, column: 9, scope: !49)
!55 = !DILocation(line: 37, column: 31, scope: !45)
!56 = !DILocation(line: 37, column: 9, scope: !45)
!57 = distinct !{!57, !47, !58, !59}
!58 = !DILocation(line: 40, column: 9, scope: !42)
!59 = !{!"llvm.loop.mustprogress"}
!60 = !DILocation(line: 42, column: 9, scope: !31)
!61 = !DILocation(line: 42, column: 21, scope: !31)
!62 = !DILocation(line: 43, column: 19, scope: !31)
!63 = !DILocation(line: 43, column: 9, scope: !31)
!64 = !DILocation(line: 45, column: 1, scope: !11)
!65 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_declare_loop_01_good", scope: !12, file: !12, line: 76, type: !13, scopeLine: 77, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DILocation(line: 78, column: 5, scope: !65)
!67 = !DILocation(line: 79, column: 1, scope: !65)
!68 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 91, type: !69, scopeLine: 92, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DISubroutineType(types: !70)
!70 = !{!71, !71, !72}
!71 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!73 = !DILocalVariable(name: "argc", arg: 1, scope: !68, file: !12, line: 91, type: !71)
!74 = !DILocation(line: 91, column: 14, scope: !68)
!75 = !DILocalVariable(name: "argv", arg: 2, scope: !68, file: !12, line: 91, type: !72)
!76 = !DILocation(line: 91, column: 27, scope: !68)
!77 = !DILocation(line: 94, column: 22, scope: !68)
!78 = !DILocation(line: 94, column: 12, scope: !68)
!79 = !DILocation(line: 94, column: 5, scope: !68)
!80 = !DILocation(line: 96, column: 5, scope: !68)
!81 = !DILocation(line: 97, column: 5, scope: !68)
!82 = !DILocation(line: 98, column: 5, scope: !68)
!83 = !DILocation(line: 101, column: 5, scope: !68)
!84 = !DILocation(line: 102, column: 5, scope: !68)
!85 = !DILocation(line: 103, column: 5, scope: !68)
!86 = !DILocation(line: 105, column: 5, scope: !68)
!87 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 52, type: !13, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DILocalVariable(name: "data", scope: !87, file: !12, line: 54, type: !16)
!89 = !DILocation(line: 54, column: 12, scope: !87)
!90 = !DILocalVariable(name: "dataBuffer", scope: !87, file: !12, line: 55, type: !20)
!91 = !DILocation(line: 55, column: 10, scope: !87)
!92 = !DILocation(line: 56, column: 5, scope: !87)
!93 = !DILocation(line: 57, column: 5, scope: !87)
!94 = !DILocation(line: 57, column: 23, scope: !87)
!95 = !DILocation(line: 59, column: 12, scope: !87)
!96 = !DILocation(line: 59, column: 10, scope: !87)
!97 = !DILocalVariable(name: "i", scope: !98, file: !12, line: 61, type: !32)
!98 = distinct !DILexicalBlock(scope: !87, file: !12, line: 60, column: 5)
!99 = !DILocation(line: 61, column: 16, scope: !98)
!100 = !DILocalVariable(name: "dest", scope: !98, file: !12, line: 62, type: !20)
!101 = !DILocation(line: 62, column: 14, scope: !98)
!102 = !DILocation(line: 63, column: 9, scope: !98)
!103 = !DILocation(line: 64, column: 9, scope: !98)
!104 = !DILocation(line: 64, column: 21, scope: !98)
!105 = !DILocation(line: 66, column: 16, scope: !106)
!106 = distinct !DILexicalBlock(scope: !98, file: !12, line: 66, column: 9)
!107 = !DILocation(line: 66, column: 14, scope: !106)
!108 = !DILocation(line: 66, column: 21, scope: !109)
!109 = distinct !DILexicalBlock(scope: !106, file: !12, line: 66, column: 9)
!110 = !DILocation(line: 66, column: 23, scope: !109)
!111 = !DILocation(line: 66, column: 9, scope: !106)
!112 = !DILocation(line: 68, column: 23, scope: !113)
!113 = distinct !DILexicalBlock(scope: !109, file: !12, line: 67, column: 9)
!114 = !DILocation(line: 68, column: 28, scope: !113)
!115 = !DILocation(line: 68, column: 18, scope: !113)
!116 = !DILocation(line: 68, column: 13, scope: !113)
!117 = !DILocation(line: 68, column: 21, scope: !113)
!118 = !DILocation(line: 69, column: 9, scope: !113)
!119 = !DILocation(line: 66, column: 31, scope: !109)
!120 = !DILocation(line: 66, column: 9, scope: !109)
!121 = distinct !{!121, !111, !122, !59}
!122 = !DILocation(line: 69, column: 9, scope: !106)
!123 = !DILocation(line: 71, column: 9, scope: !98)
!124 = !DILocation(line: 71, column: 21, scope: !98)
!125 = !DILocation(line: 72, column: 19, scope: !98)
!126 = !DILocation(line: 72, column: 9, scope: !98)
!127 = !DILocation(line: 74, column: 1, scope: !87)

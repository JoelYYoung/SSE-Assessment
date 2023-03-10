; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__char_declare_loop_41.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__char_declare_loop_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_declare_loop_41_badSink(i8* %data) #0 !dbg !11 {
entry:
  %data.addr = alloca i8*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i64* %i, metadata !19, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !25, metadata !DIExpression()), !dbg !29
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !30
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !30
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !31
  store i8 0, i8* %arrayidx, align 1, !dbg !32
  store i64 0, i64* %i, align 8, !dbg !33
  br label %for.cond, !dbg !35

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !36
  %cmp = icmp ult i64 %0, 100, !dbg !38
  br i1 %cmp, label %for.body, label %for.end, !dbg !39

for.body:                                         ; preds = %for.cond
  %1 = load i8*, i8** %data.addr, align 8, !dbg !40
  %2 = load i64, i64* %i, align 8, !dbg !42
  %arrayidx1 = getelementptr inbounds i8, i8* %1, i64 %2, !dbg !40
  %3 = load i8, i8* %arrayidx1, align 1, !dbg !40
  %4 = load i64, i64* %i, align 8, !dbg !43
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %4, !dbg !44
  store i8 %3, i8* %arrayidx2, align 1, !dbg !45
  br label %for.inc, !dbg !46

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !47
  %inc = add i64 %5, 1, !dbg !47
  store i64 %inc, i64* %i, align 8, !dbg !47
  br label %for.cond, !dbg !48, !llvm.loop !49

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !52
  store i8 0, i8* %arrayidx3, align 1, !dbg !53
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !54
  call void @printLine(i8* %arraydecay4), !dbg !55
  ret void, !dbg !56
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_declare_loop_41_bad() #0 !dbg !57 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !60, metadata !DIExpression()), !dbg !61
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !62, metadata !DIExpression()), !dbg !63
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !64
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !64
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !65
  store i8 0, i8* %arrayidx, align 1, !dbg !66
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !67
  %add.ptr = getelementptr inbounds i8, i8* %arraydecay1, i64 -8, !dbg !68
  store i8* %add.ptr, i8** %data, align 8, !dbg !69
  %0 = load i8*, i8** %data, align 8, !dbg !70
  call void @CWE127_Buffer_Underread__char_declare_loop_41_badSink(i8* %0), !dbg !71
  ret void, !dbg !72
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_declare_loop_41_goodG2BSink(i8* %data) #0 !dbg !73 {
entry:
  %data.addr = alloca i8*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !74, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.declare(metadata i64* %i, metadata !76, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !79, metadata !DIExpression()), !dbg !80
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !81
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !81
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !82
  store i8 0, i8* %arrayidx, align 1, !dbg !83
  store i64 0, i64* %i, align 8, !dbg !84
  br label %for.cond, !dbg !86

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !87
  %cmp = icmp ult i64 %0, 100, !dbg !89
  br i1 %cmp, label %for.body, label %for.end, !dbg !90

for.body:                                         ; preds = %for.cond
  %1 = load i8*, i8** %data.addr, align 8, !dbg !91
  %2 = load i64, i64* %i, align 8, !dbg !93
  %arrayidx1 = getelementptr inbounds i8, i8* %1, i64 %2, !dbg !91
  %3 = load i8, i8* %arrayidx1, align 1, !dbg !91
  %4 = load i64, i64* %i, align 8, !dbg !94
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %4, !dbg !95
  store i8 %3, i8* %arrayidx2, align 1, !dbg !96
  br label %for.inc, !dbg !97

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !98
  %inc = add i64 %5, 1, !dbg !98
  store i64 %inc, i64* %i, align 8, !dbg !98
  br label %for.cond, !dbg !99, !llvm.loop !100

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !102
  store i8 0, i8* %arrayidx3, align 1, !dbg !103
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !104
  call void @printLine(i8* %arraydecay4), !dbg !105
  ret void, !dbg !106
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_declare_loop_41_good() #0 !dbg !107 {
entry:
  call void @goodG2B(), !dbg !108
  ret void, !dbg !109
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !110 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !115, metadata !DIExpression()), !dbg !116
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !117, metadata !DIExpression()), !dbg !118
  %call = call i64 @time(i64* null) #5, !dbg !119
  %conv = trunc i64 %call to i32, !dbg !120
  call void @srand(i32 %conv) #5, !dbg !121
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !122
  call void @CWE127_Buffer_Underread__char_declare_loop_41_good(), !dbg !123
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !124
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !125
  call void @CWE127_Buffer_Underread__char_declare_loop_41_bad(), !dbg !126
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !127
  ret i32 0, !dbg !128
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !129 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !130, metadata !DIExpression()), !dbg !131
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !132, metadata !DIExpression()), !dbg !133
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !134
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !134
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !135
  store i8 0, i8* %arrayidx, align 1, !dbg !136
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !137
  store i8* %arraydecay1, i8** %data, align 8, !dbg !138
  %0 = load i8*, i8** %data, align 8, !dbg !139
  call void @CWE127_Buffer_Underread__char_declare_loop_41_goodG2BSink(i8* %0), !dbg !140
  ret void, !dbg !141
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__char_declare_loop_41.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_declare_loop_41_badSink", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__char_declare_loop_41.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null, !15}
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!16 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!17 = !DILocalVariable(name: "data", arg: 1, scope: !11, file: !12, line: 23, type: !15)
!18 = !DILocation(line: 23, column: 67, scope: !11)
!19 = !DILocalVariable(name: "i", scope: !20, file: !12, line: 26, type: !21)
!20 = distinct !DILexicalBlock(scope: !11, file: !12, line: 25, column: 5)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !22, line: 46, baseType: !23)
!22 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!23 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!24 = !DILocation(line: 26, column: 16, scope: !20)
!25 = !DILocalVariable(name: "dest", scope: !20, file: !12, line: 27, type: !26)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 800, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 100)
!29 = !DILocation(line: 27, column: 14, scope: !20)
!30 = !DILocation(line: 28, column: 9, scope: !20)
!31 = !DILocation(line: 29, column: 9, scope: !20)
!32 = !DILocation(line: 29, column: 21, scope: !20)
!33 = !DILocation(line: 31, column: 16, scope: !34)
!34 = distinct !DILexicalBlock(scope: !20, file: !12, line: 31, column: 9)
!35 = !DILocation(line: 31, column: 14, scope: !34)
!36 = !DILocation(line: 31, column: 21, scope: !37)
!37 = distinct !DILexicalBlock(scope: !34, file: !12, line: 31, column: 9)
!38 = !DILocation(line: 31, column: 23, scope: !37)
!39 = !DILocation(line: 31, column: 9, scope: !34)
!40 = !DILocation(line: 33, column: 23, scope: !41)
!41 = distinct !DILexicalBlock(scope: !37, file: !12, line: 32, column: 9)
!42 = !DILocation(line: 33, column: 28, scope: !41)
!43 = !DILocation(line: 33, column: 18, scope: !41)
!44 = !DILocation(line: 33, column: 13, scope: !41)
!45 = !DILocation(line: 33, column: 21, scope: !41)
!46 = !DILocation(line: 34, column: 9, scope: !41)
!47 = !DILocation(line: 31, column: 31, scope: !37)
!48 = !DILocation(line: 31, column: 9, scope: !37)
!49 = distinct !{!49, !39, !50, !51}
!50 = !DILocation(line: 34, column: 9, scope: !34)
!51 = !{!"llvm.loop.mustprogress"}
!52 = !DILocation(line: 36, column: 9, scope: !20)
!53 = !DILocation(line: 36, column: 21, scope: !20)
!54 = !DILocation(line: 37, column: 19, scope: !20)
!55 = !DILocation(line: 37, column: 9, scope: !20)
!56 = !DILocation(line: 39, column: 1, scope: !11)
!57 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_declare_loop_41_bad", scope: !12, file: !12, line: 41, type: !58, scopeLine: 42, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DISubroutineType(types: !59)
!59 = !{null}
!60 = !DILocalVariable(name: "data", scope: !57, file: !12, line: 43, type: !15)
!61 = !DILocation(line: 43, column: 12, scope: !57)
!62 = !DILocalVariable(name: "dataBuffer", scope: !57, file: !12, line: 44, type: !26)
!63 = !DILocation(line: 44, column: 10, scope: !57)
!64 = !DILocation(line: 45, column: 5, scope: !57)
!65 = !DILocation(line: 46, column: 5, scope: !57)
!66 = !DILocation(line: 46, column: 23, scope: !57)
!67 = !DILocation(line: 48, column: 12, scope: !57)
!68 = !DILocation(line: 48, column: 23, scope: !57)
!69 = !DILocation(line: 48, column: 10, scope: !57)
!70 = !DILocation(line: 49, column: 59, scope: !57)
!71 = !DILocation(line: 49, column: 5, scope: !57)
!72 = !DILocation(line: 50, column: 1, scope: !57)
!73 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_declare_loop_41_goodG2BSink", scope: !12, file: !12, line: 56, type: !13, scopeLine: 57, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DILocalVariable(name: "data", arg: 1, scope: !73, file: !12, line: 56, type: !15)
!75 = !DILocation(line: 56, column: 71, scope: !73)
!76 = !DILocalVariable(name: "i", scope: !77, file: !12, line: 59, type: !21)
!77 = distinct !DILexicalBlock(scope: !73, file: !12, line: 58, column: 5)
!78 = !DILocation(line: 59, column: 16, scope: !77)
!79 = !DILocalVariable(name: "dest", scope: !77, file: !12, line: 60, type: !26)
!80 = !DILocation(line: 60, column: 14, scope: !77)
!81 = !DILocation(line: 61, column: 9, scope: !77)
!82 = !DILocation(line: 62, column: 9, scope: !77)
!83 = !DILocation(line: 62, column: 21, scope: !77)
!84 = !DILocation(line: 64, column: 16, scope: !85)
!85 = distinct !DILexicalBlock(scope: !77, file: !12, line: 64, column: 9)
!86 = !DILocation(line: 64, column: 14, scope: !85)
!87 = !DILocation(line: 64, column: 21, scope: !88)
!88 = distinct !DILexicalBlock(scope: !85, file: !12, line: 64, column: 9)
!89 = !DILocation(line: 64, column: 23, scope: !88)
!90 = !DILocation(line: 64, column: 9, scope: !85)
!91 = !DILocation(line: 66, column: 23, scope: !92)
!92 = distinct !DILexicalBlock(scope: !88, file: !12, line: 65, column: 9)
!93 = !DILocation(line: 66, column: 28, scope: !92)
!94 = !DILocation(line: 66, column: 18, scope: !92)
!95 = !DILocation(line: 66, column: 13, scope: !92)
!96 = !DILocation(line: 66, column: 21, scope: !92)
!97 = !DILocation(line: 67, column: 9, scope: !92)
!98 = !DILocation(line: 64, column: 31, scope: !88)
!99 = !DILocation(line: 64, column: 9, scope: !88)
!100 = distinct !{!100, !90, !101, !51}
!101 = !DILocation(line: 67, column: 9, scope: !85)
!102 = !DILocation(line: 69, column: 9, scope: !77)
!103 = !DILocation(line: 69, column: 21, scope: !77)
!104 = !DILocation(line: 70, column: 19, scope: !77)
!105 = !DILocation(line: 70, column: 9, scope: !77)
!106 = !DILocation(line: 72, column: 1, scope: !73)
!107 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_declare_loop_41_good", scope: !12, file: !12, line: 86, type: !58, scopeLine: 87, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!108 = !DILocation(line: 88, column: 5, scope: !107)
!109 = !DILocation(line: 89, column: 1, scope: !107)
!110 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 101, type: !111, scopeLine: 102, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!111 = !DISubroutineType(types: !112)
!112 = !{!113, !113, !114}
!113 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!114 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!115 = !DILocalVariable(name: "argc", arg: 1, scope: !110, file: !12, line: 101, type: !113)
!116 = !DILocation(line: 101, column: 14, scope: !110)
!117 = !DILocalVariable(name: "argv", arg: 2, scope: !110, file: !12, line: 101, type: !114)
!118 = !DILocation(line: 101, column: 27, scope: !110)
!119 = !DILocation(line: 104, column: 22, scope: !110)
!120 = !DILocation(line: 104, column: 12, scope: !110)
!121 = !DILocation(line: 104, column: 5, scope: !110)
!122 = !DILocation(line: 106, column: 5, scope: !110)
!123 = !DILocation(line: 107, column: 5, scope: !110)
!124 = !DILocation(line: 108, column: 5, scope: !110)
!125 = !DILocation(line: 111, column: 5, scope: !110)
!126 = !DILocation(line: 112, column: 5, scope: !110)
!127 = !DILocation(line: 113, column: 5, scope: !110)
!128 = !DILocation(line: 115, column: 5, scope: !110)
!129 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 75, type: !58, scopeLine: 76, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!130 = !DILocalVariable(name: "data", scope: !129, file: !12, line: 77, type: !15)
!131 = !DILocation(line: 77, column: 12, scope: !129)
!132 = !DILocalVariable(name: "dataBuffer", scope: !129, file: !12, line: 78, type: !26)
!133 = !DILocation(line: 78, column: 10, scope: !129)
!134 = !DILocation(line: 79, column: 5, scope: !129)
!135 = !DILocation(line: 80, column: 5, scope: !129)
!136 = !DILocation(line: 80, column: 23, scope: !129)
!137 = !DILocation(line: 82, column: 12, scope: !129)
!138 = !DILocation(line: 82, column: 10, scope: !129)
!139 = !DILocation(line: 83, column: 63, scope: !129)
!140 = !DILocation(line: 83, column: 5, scope: !129)
!141 = !DILocation(line: 84, column: 1, scope: !129)

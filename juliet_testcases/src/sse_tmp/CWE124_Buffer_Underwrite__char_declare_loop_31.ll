; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__char_declare_loop_31.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__char_declare_loop_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__char_declare_loop_31_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dataCopy = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !19, metadata !DIExpression()), !dbg !23
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !24
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !24
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !25
  store i8 0, i8* %arrayidx, align 1, !dbg !26
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !27
  %add.ptr = getelementptr inbounds i8, i8* %arraydecay1, i64 -8, !dbg !28
  store i8* %add.ptr, i8** %data, align 8, !dbg !29
  call void @llvm.dbg.declare(metadata i8** %dataCopy, metadata !30, metadata !DIExpression()), !dbg !32
  %0 = load i8*, i8** %data, align 8, !dbg !33
  store i8* %0, i8** %dataCopy, align 8, !dbg !32
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !34, metadata !DIExpression()), !dbg !35
  %1 = load i8*, i8** %dataCopy, align 8, !dbg !36
  store i8* %1, i8** %data2, align 8, !dbg !35
  call void @llvm.dbg.declare(metadata i64* %i, metadata !37, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !43, metadata !DIExpression()), !dbg !44
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !45
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay3, i8 67, i64 99, i1 false), !dbg !45
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !46
  store i8 0, i8* %arrayidx4, align 1, !dbg !47
  store i64 0, i64* %i, align 8, !dbg !48
  br label %for.cond, !dbg !50

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !51
  %cmp = icmp ult i64 %2, 100, !dbg !53
  br i1 %cmp, label %for.body, label %for.end, !dbg !54

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !55
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %3, !dbg !57
  %4 = load i8, i8* %arrayidx5, align 1, !dbg !57
  %5 = load i8*, i8** %data2, align 8, !dbg !58
  %6 = load i64, i64* %i, align 8, !dbg !59
  %arrayidx6 = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !58
  store i8 %4, i8* %arrayidx6, align 1, !dbg !60
  br label %for.inc, !dbg !61

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !62
  %inc = add i64 %7, 1, !dbg !62
  store i64 %inc, i64* %i, align 8, !dbg !62
  br label %for.cond, !dbg !63, !llvm.loop !64

for.end:                                          ; preds = %for.cond
  %8 = load i8*, i8** %data2, align 8, !dbg !67
  %arrayidx7 = getelementptr inbounds i8, i8* %8, i64 99, !dbg !67
  store i8 0, i8* %arrayidx7, align 1, !dbg !68
  %9 = load i8*, i8** %data2, align 8, !dbg !69
  call void @printLine(i8* %9), !dbg !70
  ret void, !dbg !71
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__char_declare_loop_31_good() #0 !dbg !72 {
entry:
  call void @goodG2B(), !dbg !73
  ret void, !dbg !74
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !75 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !80, metadata !DIExpression()), !dbg !81
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !82, metadata !DIExpression()), !dbg !83
  %call = call i64 @time(i64* null) #5, !dbg !84
  %conv = trunc i64 %call to i32, !dbg !85
  call void @srand(i32 %conv) #5, !dbg !86
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !87
  call void @CWE124_Buffer_Underwrite__char_declare_loop_31_good(), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !90
  call void @CWE124_Buffer_Underwrite__char_declare_loop_31_bad(), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !92
  ret i32 0, !dbg !93
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !94 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dataCopy = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !95, metadata !DIExpression()), !dbg !96
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !97, metadata !DIExpression()), !dbg !98
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !99
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !99
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !100
  store i8 0, i8* %arrayidx, align 1, !dbg !101
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !102
  store i8* %arraydecay1, i8** %data, align 8, !dbg !103
  call void @llvm.dbg.declare(metadata i8** %dataCopy, metadata !104, metadata !DIExpression()), !dbg !106
  %0 = load i8*, i8** %data, align 8, !dbg !107
  store i8* %0, i8** %dataCopy, align 8, !dbg !106
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !108, metadata !DIExpression()), !dbg !109
  %1 = load i8*, i8** %dataCopy, align 8, !dbg !110
  store i8* %1, i8** %data2, align 8, !dbg !109
  call void @llvm.dbg.declare(metadata i64* %i, metadata !111, metadata !DIExpression()), !dbg !113
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !114, metadata !DIExpression()), !dbg !115
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !116
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay3, i8 67, i64 99, i1 false), !dbg !116
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !117
  store i8 0, i8* %arrayidx4, align 1, !dbg !118
  store i64 0, i64* %i, align 8, !dbg !119
  br label %for.cond, !dbg !121

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !122
  %cmp = icmp ult i64 %2, 100, !dbg !124
  br i1 %cmp, label %for.body, label %for.end, !dbg !125

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !126
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %3, !dbg !128
  %4 = load i8, i8* %arrayidx5, align 1, !dbg !128
  %5 = load i8*, i8** %data2, align 8, !dbg !129
  %6 = load i64, i64* %i, align 8, !dbg !130
  %arrayidx6 = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !129
  store i8 %4, i8* %arrayidx6, align 1, !dbg !131
  br label %for.inc, !dbg !132

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !133
  %inc = add i64 %7, 1, !dbg !133
  store i64 %inc, i64* %i, align 8, !dbg !133
  br label %for.cond, !dbg !134, !llvm.loop !135

for.end:                                          ; preds = %for.cond
  %8 = load i8*, i8** %data2, align 8, !dbg !137
  %arrayidx7 = getelementptr inbounds i8, i8* %8, i64 99, !dbg !137
  store i8 0, i8* %arrayidx7, align 1, !dbg !138
  %9 = load i8*, i8** %data2, align 8, !dbg !139
  call void @printLine(i8* %9), !dbg !140
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__char_declare_loop_31.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__char_declare_loop_31_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__char_declare_loop_31.c", directory: "/home/joelyang/SSE-Assessment")
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
!30 = !DILocalVariable(name: "dataCopy", scope: !31, file: !12, line: 32, type: !16)
!31 = distinct !DILexicalBlock(scope: !11, file: !12, line: 31, column: 5)
!32 = !DILocation(line: 32, column: 16, scope: !31)
!33 = !DILocation(line: 32, column: 27, scope: !31)
!34 = !DILocalVariable(name: "data", scope: !31, file: !12, line: 33, type: !16)
!35 = !DILocation(line: 33, column: 16, scope: !31)
!36 = !DILocation(line: 33, column: 23, scope: !31)
!37 = !DILocalVariable(name: "i", scope: !38, file: !12, line: 35, type: !39)
!38 = distinct !DILexicalBlock(scope: !31, file: !12, line: 34, column: 9)
!39 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !40, line: 46, baseType: !41)
!40 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!41 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!42 = !DILocation(line: 35, column: 20, scope: !38)
!43 = !DILocalVariable(name: "source", scope: !38, file: !12, line: 36, type: !20)
!44 = !DILocation(line: 36, column: 18, scope: !38)
!45 = !DILocation(line: 37, column: 13, scope: !38)
!46 = !DILocation(line: 38, column: 13, scope: !38)
!47 = !DILocation(line: 38, column: 27, scope: !38)
!48 = !DILocation(line: 40, column: 20, scope: !49)
!49 = distinct !DILexicalBlock(scope: !38, file: !12, line: 40, column: 13)
!50 = !DILocation(line: 40, column: 18, scope: !49)
!51 = !DILocation(line: 40, column: 25, scope: !52)
!52 = distinct !DILexicalBlock(scope: !49, file: !12, line: 40, column: 13)
!53 = !DILocation(line: 40, column: 27, scope: !52)
!54 = !DILocation(line: 40, column: 13, scope: !49)
!55 = !DILocation(line: 42, column: 34, scope: !56)
!56 = distinct !DILexicalBlock(scope: !52, file: !12, line: 41, column: 13)
!57 = !DILocation(line: 42, column: 27, scope: !56)
!58 = !DILocation(line: 42, column: 17, scope: !56)
!59 = !DILocation(line: 42, column: 22, scope: !56)
!60 = !DILocation(line: 42, column: 25, scope: !56)
!61 = !DILocation(line: 43, column: 13, scope: !56)
!62 = !DILocation(line: 40, column: 35, scope: !52)
!63 = !DILocation(line: 40, column: 13, scope: !52)
!64 = distinct !{!64, !54, !65, !66}
!65 = !DILocation(line: 43, column: 13, scope: !49)
!66 = !{!"llvm.loop.mustprogress"}
!67 = !DILocation(line: 45, column: 13, scope: !38)
!68 = !DILocation(line: 45, column: 25, scope: !38)
!69 = !DILocation(line: 46, column: 23, scope: !38)
!70 = !DILocation(line: 46, column: 13, scope: !38)
!71 = !DILocation(line: 49, column: 1, scope: !11)
!72 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__char_declare_loop_31_good", scope: !12, file: !12, line: 84, type: !13, scopeLine: 85, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DILocation(line: 86, column: 5, scope: !72)
!74 = !DILocation(line: 87, column: 1, scope: !72)
!75 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 98, type: !76, scopeLine: 99, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DISubroutineType(types: !77)
!77 = !{!78, !78, !79}
!78 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!80 = !DILocalVariable(name: "argc", arg: 1, scope: !75, file: !12, line: 98, type: !78)
!81 = !DILocation(line: 98, column: 14, scope: !75)
!82 = !DILocalVariable(name: "argv", arg: 2, scope: !75, file: !12, line: 98, type: !79)
!83 = !DILocation(line: 98, column: 27, scope: !75)
!84 = !DILocation(line: 101, column: 22, scope: !75)
!85 = !DILocation(line: 101, column: 12, scope: !75)
!86 = !DILocation(line: 101, column: 5, scope: !75)
!87 = !DILocation(line: 103, column: 5, scope: !75)
!88 = !DILocation(line: 104, column: 5, scope: !75)
!89 = !DILocation(line: 105, column: 5, scope: !75)
!90 = !DILocation(line: 108, column: 5, scope: !75)
!91 = !DILocation(line: 109, column: 5, scope: !75)
!92 = !DILocation(line: 110, column: 5, scope: !75)
!93 = !DILocation(line: 112, column: 5, scope: !75)
!94 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 56, type: !13, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!95 = !DILocalVariable(name: "data", scope: !94, file: !12, line: 58, type: !16)
!96 = !DILocation(line: 58, column: 12, scope: !94)
!97 = !DILocalVariable(name: "dataBuffer", scope: !94, file: !12, line: 59, type: !20)
!98 = !DILocation(line: 59, column: 10, scope: !94)
!99 = !DILocation(line: 60, column: 5, scope: !94)
!100 = !DILocation(line: 61, column: 5, scope: !94)
!101 = !DILocation(line: 61, column: 23, scope: !94)
!102 = !DILocation(line: 63, column: 12, scope: !94)
!103 = !DILocation(line: 63, column: 10, scope: !94)
!104 = !DILocalVariable(name: "dataCopy", scope: !105, file: !12, line: 65, type: !16)
!105 = distinct !DILexicalBlock(scope: !94, file: !12, line: 64, column: 5)
!106 = !DILocation(line: 65, column: 16, scope: !105)
!107 = !DILocation(line: 65, column: 27, scope: !105)
!108 = !DILocalVariable(name: "data", scope: !105, file: !12, line: 66, type: !16)
!109 = !DILocation(line: 66, column: 16, scope: !105)
!110 = !DILocation(line: 66, column: 23, scope: !105)
!111 = !DILocalVariable(name: "i", scope: !112, file: !12, line: 68, type: !39)
!112 = distinct !DILexicalBlock(scope: !105, file: !12, line: 67, column: 9)
!113 = !DILocation(line: 68, column: 20, scope: !112)
!114 = !DILocalVariable(name: "source", scope: !112, file: !12, line: 69, type: !20)
!115 = !DILocation(line: 69, column: 18, scope: !112)
!116 = !DILocation(line: 70, column: 13, scope: !112)
!117 = !DILocation(line: 71, column: 13, scope: !112)
!118 = !DILocation(line: 71, column: 27, scope: !112)
!119 = !DILocation(line: 73, column: 20, scope: !120)
!120 = distinct !DILexicalBlock(scope: !112, file: !12, line: 73, column: 13)
!121 = !DILocation(line: 73, column: 18, scope: !120)
!122 = !DILocation(line: 73, column: 25, scope: !123)
!123 = distinct !DILexicalBlock(scope: !120, file: !12, line: 73, column: 13)
!124 = !DILocation(line: 73, column: 27, scope: !123)
!125 = !DILocation(line: 73, column: 13, scope: !120)
!126 = !DILocation(line: 75, column: 34, scope: !127)
!127 = distinct !DILexicalBlock(scope: !123, file: !12, line: 74, column: 13)
!128 = !DILocation(line: 75, column: 27, scope: !127)
!129 = !DILocation(line: 75, column: 17, scope: !127)
!130 = !DILocation(line: 75, column: 22, scope: !127)
!131 = !DILocation(line: 75, column: 25, scope: !127)
!132 = !DILocation(line: 76, column: 13, scope: !127)
!133 = !DILocation(line: 73, column: 35, scope: !123)
!134 = !DILocation(line: 73, column: 13, scope: !123)
!135 = distinct !{!135, !125, !136, !66}
!136 = !DILocation(line: 76, column: 13, scope: !120)
!137 = !DILocation(line: 78, column: 13, scope: !112)
!138 = !DILocation(line: 78, column: 25, scope: !112)
!139 = !DILocation(line: 79, column: 23, scope: !112)
!140 = !DILocation(line: 79, column: 13, scope: !112)
!141 = !DILocation(line: 82, column: 1, scope: !94)

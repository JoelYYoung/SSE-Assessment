; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__char_alloca_loop_31.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__char_alloca_loop_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__char_alloca_loop_31_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dataCopy = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = alloca i8, i64 100, align 16, !dbg !21
  store i8* %0, i8** %dataBuffer, align 8, !dbg !20
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !22
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !23
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !24
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !24
  store i8 0, i8* %arrayidx, align 1, !dbg !25
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !26
  %add.ptr = getelementptr inbounds i8, i8* %3, i64 -8, !dbg !27
  store i8* %add.ptr, i8** %data, align 8, !dbg !28
  call void @llvm.dbg.declare(metadata i8** %dataCopy, metadata !29, metadata !DIExpression()), !dbg !31
  %4 = load i8*, i8** %data, align 8, !dbg !32
  store i8* %4, i8** %dataCopy, align 8, !dbg !31
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !33, metadata !DIExpression()), !dbg !34
  %5 = load i8*, i8** %dataCopy, align 8, !dbg !35
  store i8* %5, i8** %data1, align 8, !dbg !34
  call void @llvm.dbg.declare(metadata i64* %i, metadata !36, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !42, metadata !DIExpression()), !dbg !46
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !47
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !47
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !48
  store i8 0, i8* %arrayidx2, align 1, !dbg !49
  store i64 0, i64* %i, align 8, !dbg !50
  br label %for.cond, !dbg !52

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !53
  %cmp = icmp ult i64 %6, 100, !dbg !55
  br i1 %cmp, label %for.body, label %for.end, !dbg !56

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !57
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %7, !dbg !59
  %8 = load i8, i8* %arrayidx3, align 1, !dbg !59
  %9 = load i8*, i8** %data1, align 8, !dbg !60
  %10 = load i64, i64* %i, align 8, !dbg !61
  %arrayidx4 = getelementptr inbounds i8, i8* %9, i64 %10, !dbg !60
  store i8 %8, i8* %arrayidx4, align 1, !dbg !62
  br label %for.inc, !dbg !63

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !64
  %inc = add i64 %11, 1, !dbg !64
  store i64 %inc, i64* %i, align 8, !dbg !64
  br label %for.cond, !dbg !65, !llvm.loop !66

for.end:                                          ; preds = %for.cond
  %12 = load i8*, i8** %data1, align 8, !dbg !69
  %arrayidx5 = getelementptr inbounds i8, i8* %12, i64 99, !dbg !69
  store i8 0, i8* %arrayidx5, align 1, !dbg !70
  %13 = load i8*, i8** %data1, align 8, !dbg !71
  call void @printLine(i8* %13), !dbg !72
  ret void, !dbg !73
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__char_alloca_loop_31_good() #0 !dbg !74 {
entry:
  call void @goodG2B(), !dbg !75
  ret void, !dbg !76
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !77 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !82, metadata !DIExpression()), !dbg !83
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !84, metadata !DIExpression()), !dbg !85
  %call = call i64 @time(i64* null) #5, !dbg !86
  %conv = trunc i64 %call to i32, !dbg !87
  call void @srand(i32 %conv) #5, !dbg !88
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !89
  call void @CWE124_Buffer_Underwrite__char_alloca_loop_31_good(), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !92
  call void @CWE124_Buffer_Underwrite__char_alloca_loop_31_bad(), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !94
  ret i32 0, !dbg !95
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !96 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dataCopy = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !97, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !99, metadata !DIExpression()), !dbg !100
  %0 = alloca i8, i64 100, align 16, !dbg !101
  store i8* %0, i8** %dataBuffer, align 8, !dbg !100
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !102
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !103
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !104
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !104
  store i8 0, i8* %arrayidx, align 1, !dbg !105
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !106
  store i8* %3, i8** %data, align 8, !dbg !107
  call void @llvm.dbg.declare(metadata i8** %dataCopy, metadata !108, metadata !DIExpression()), !dbg !110
  %4 = load i8*, i8** %data, align 8, !dbg !111
  store i8* %4, i8** %dataCopy, align 8, !dbg !110
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !112, metadata !DIExpression()), !dbg !113
  %5 = load i8*, i8** %dataCopy, align 8, !dbg !114
  store i8* %5, i8** %data1, align 8, !dbg !113
  call void @llvm.dbg.declare(metadata i64* %i, metadata !115, metadata !DIExpression()), !dbg !117
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !118, metadata !DIExpression()), !dbg !119
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !120
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !120
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !121
  store i8 0, i8* %arrayidx2, align 1, !dbg !122
  store i64 0, i64* %i, align 8, !dbg !123
  br label %for.cond, !dbg !125

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !126
  %cmp = icmp ult i64 %6, 100, !dbg !128
  br i1 %cmp, label %for.body, label %for.end, !dbg !129

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !130
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %7, !dbg !132
  %8 = load i8, i8* %arrayidx3, align 1, !dbg !132
  %9 = load i8*, i8** %data1, align 8, !dbg !133
  %10 = load i64, i64* %i, align 8, !dbg !134
  %arrayidx4 = getelementptr inbounds i8, i8* %9, i64 %10, !dbg !133
  store i8 %8, i8* %arrayidx4, align 1, !dbg !135
  br label %for.inc, !dbg !136

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !137
  %inc = add i64 %11, 1, !dbg !137
  store i64 %inc, i64* %i, align 8, !dbg !137
  br label %for.cond, !dbg !138, !llvm.loop !139

for.end:                                          ; preds = %for.cond
  %12 = load i8*, i8** %data1, align 8, !dbg !141
  %arrayidx5 = getelementptr inbounds i8, i8* %12, i64 99, !dbg !141
  store i8 0, i8* %arrayidx5, align 1, !dbg !142
  %13 = load i8*, i8** %data1, align 8, !dbg !143
  call void @printLine(i8* %13), !dbg !144
  ret void, !dbg !145
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__char_alloca_loop_31.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__char_alloca_loop_31_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__char_alloca_loop_31.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 25, type: !4)
!18 = !DILocation(line: 25, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataBuffer", scope: !13, file: !14, line: 26, type: !4)
!20 = !DILocation(line: 26, column: 12, scope: !13)
!21 = !DILocation(line: 26, column: 33, scope: !13)
!22 = !DILocation(line: 27, column: 12, scope: !13)
!23 = !DILocation(line: 27, column: 5, scope: !13)
!24 = !DILocation(line: 28, column: 5, scope: !13)
!25 = !DILocation(line: 28, column: 23, scope: !13)
!26 = !DILocation(line: 30, column: 12, scope: !13)
!27 = !DILocation(line: 30, column: 23, scope: !13)
!28 = !DILocation(line: 30, column: 10, scope: !13)
!29 = !DILocalVariable(name: "dataCopy", scope: !30, file: !14, line: 32, type: !4)
!30 = distinct !DILexicalBlock(scope: !13, file: !14, line: 31, column: 5)
!31 = !DILocation(line: 32, column: 16, scope: !30)
!32 = !DILocation(line: 32, column: 27, scope: !30)
!33 = !DILocalVariable(name: "data", scope: !30, file: !14, line: 33, type: !4)
!34 = !DILocation(line: 33, column: 16, scope: !30)
!35 = !DILocation(line: 33, column: 23, scope: !30)
!36 = !DILocalVariable(name: "i", scope: !37, file: !14, line: 35, type: !38)
!37 = distinct !DILexicalBlock(scope: !30, file: !14, line: 34, column: 9)
!38 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !39, line: 46, baseType: !40)
!39 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!40 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!41 = !DILocation(line: 35, column: 20, scope: !37)
!42 = !DILocalVariable(name: "source", scope: !37, file: !14, line: 36, type: !43)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 100)
!46 = !DILocation(line: 36, column: 18, scope: !37)
!47 = !DILocation(line: 37, column: 13, scope: !37)
!48 = !DILocation(line: 38, column: 13, scope: !37)
!49 = !DILocation(line: 38, column: 27, scope: !37)
!50 = !DILocation(line: 40, column: 20, scope: !51)
!51 = distinct !DILexicalBlock(scope: !37, file: !14, line: 40, column: 13)
!52 = !DILocation(line: 40, column: 18, scope: !51)
!53 = !DILocation(line: 40, column: 25, scope: !54)
!54 = distinct !DILexicalBlock(scope: !51, file: !14, line: 40, column: 13)
!55 = !DILocation(line: 40, column: 27, scope: !54)
!56 = !DILocation(line: 40, column: 13, scope: !51)
!57 = !DILocation(line: 42, column: 34, scope: !58)
!58 = distinct !DILexicalBlock(scope: !54, file: !14, line: 41, column: 13)
!59 = !DILocation(line: 42, column: 27, scope: !58)
!60 = !DILocation(line: 42, column: 17, scope: !58)
!61 = !DILocation(line: 42, column: 22, scope: !58)
!62 = !DILocation(line: 42, column: 25, scope: !58)
!63 = !DILocation(line: 43, column: 13, scope: !58)
!64 = !DILocation(line: 40, column: 35, scope: !54)
!65 = !DILocation(line: 40, column: 13, scope: !54)
!66 = distinct !{!66, !56, !67, !68}
!67 = !DILocation(line: 43, column: 13, scope: !51)
!68 = !{!"llvm.loop.mustprogress"}
!69 = !DILocation(line: 45, column: 13, scope: !37)
!70 = !DILocation(line: 45, column: 25, scope: !37)
!71 = !DILocation(line: 46, column: 23, scope: !37)
!72 = !DILocation(line: 46, column: 13, scope: !37)
!73 = !DILocation(line: 49, column: 1, scope: !13)
!74 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__char_alloca_loop_31_good", scope: !14, file: !14, line: 84, type: !15, scopeLine: 85, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DILocation(line: 86, column: 5, scope: !74)
!76 = !DILocation(line: 87, column: 1, scope: !74)
!77 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 98, type: !78, scopeLine: 99, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DISubroutineType(types: !79)
!79 = !{!80, !80, !81}
!80 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!82 = !DILocalVariable(name: "argc", arg: 1, scope: !77, file: !14, line: 98, type: !80)
!83 = !DILocation(line: 98, column: 14, scope: !77)
!84 = !DILocalVariable(name: "argv", arg: 2, scope: !77, file: !14, line: 98, type: !81)
!85 = !DILocation(line: 98, column: 27, scope: !77)
!86 = !DILocation(line: 101, column: 22, scope: !77)
!87 = !DILocation(line: 101, column: 12, scope: !77)
!88 = !DILocation(line: 101, column: 5, scope: !77)
!89 = !DILocation(line: 103, column: 5, scope: !77)
!90 = !DILocation(line: 104, column: 5, scope: !77)
!91 = !DILocation(line: 105, column: 5, scope: !77)
!92 = !DILocation(line: 108, column: 5, scope: !77)
!93 = !DILocation(line: 109, column: 5, scope: !77)
!94 = !DILocation(line: 110, column: 5, scope: !77)
!95 = !DILocation(line: 112, column: 5, scope: !77)
!96 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 56, type: !15, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!97 = !DILocalVariable(name: "data", scope: !96, file: !14, line: 58, type: !4)
!98 = !DILocation(line: 58, column: 12, scope: !96)
!99 = !DILocalVariable(name: "dataBuffer", scope: !96, file: !14, line: 59, type: !4)
!100 = !DILocation(line: 59, column: 12, scope: !96)
!101 = !DILocation(line: 59, column: 33, scope: !96)
!102 = !DILocation(line: 60, column: 12, scope: !96)
!103 = !DILocation(line: 60, column: 5, scope: !96)
!104 = !DILocation(line: 61, column: 5, scope: !96)
!105 = !DILocation(line: 61, column: 23, scope: !96)
!106 = !DILocation(line: 63, column: 12, scope: !96)
!107 = !DILocation(line: 63, column: 10, scope: !96)
!108 = !DILocalVariable(name: "dataCopy", scope: !109, file: !14, line: 65, type: !4)
!109 = distinct !DILexicalBlock(scope: !96, file: !14, line: 64, column: 5)
!110 = !DILocation(line: 65, column: 16, scope: !109)
!111 = !DILocation(line: 65, column: 27, scope: !109)
!112 = !DILocalVariable(name: "data", scope: !109, file: !14, line: 66, type: !4)
!113 = !DILocation(line: 66, column: 16, scope: !109)
!114 = !DILocation(line: 66, column: 23, scope: !109)
!115 = !DILocalVariable(name: "i", scope: !116, file: !14, line: 68, type: !38)
!116 = distinct !DILexicalBlock(scope: !109, file: !14, line: 67, column: 9)
!117 = !DILocation(line: 68, column: 20, scope: !116)
!118 = !DILocalVariable(name: "source", scope: !116, file: !14, line: 69, type: !43)
!119 = !DILocation(line: 69, column: 18, scope: !116)
!120 = !DILocation(line: 70, column: 13, scope: !116)
!121 = !DILocation(line: 71, column: 13, scope: !116)
!122 = !DILocation(line: 71, column: 27, scope: !116)
!123 = !DILocation(line: 73, column: 20, scope: !124)
!124 = distinct !DILexicalBlock(scope: !116, file: !14, line: 73, column: 13)
!125 = !DILocation(line: 73, column: 18, scope: !124)
!126 = !DILocation(line: 73, column: 25, scope: !127)
!127 = distinct !DILexicalBlock(scope: !124, file: !14, line: 73, column: 13)
!128 = !DILocation(line: 73, column: 27, scope: !127)
!129 = !DILocation(line: 73, column: 13, scope: !124)
!130 = !DILocation(line: 75, column: 34, scope: !131)
!131 = distinct !DILexicalBlock(scope: !127, file: !14, line: 74, column: 13)
!132 = !DILocation(line: 75, column: 27, scope: !131)
!133 = !DILocation(line: 75, column: 17, scope: !131)
!134 = !DILocation(line: 75, column: 22, scope: !131)
!135 = !DILocation(line: 75, column: 25, scope: !131)
!136 = !DILocation(line: 76, column: 13, scope: !131)
!137 = !DILocation(line: 73, column: 35, scope: !127)
!138 = !DILocation(line: 73, column: 13, scope: !127)
!139 = distinct !{!139, !129, !140, !68}
!140 = !DILocation(line: 76, column: 13, scope: !124)
!141 = !DILocation(line: 78, column: 13, scope: !116)
!142 = !DILocation(line: 78, column: 25, scope: !116)
!143 = !DILocation(line: 79, column: 23, scope: !116)
!144 = !DILocation(line: 79, column: 13, scope: !116)
!145 = !DILocation(line: 82, column: 1, scope: !96)

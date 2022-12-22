; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_31.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_31_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dataCopy = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = alloca i8, i64 100, align 16, !dbg !21
  store i8* %0, i8** %dataBuffer, align 8, !dbg !20
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !22
  store i8* %1, i8** %data, align 8, !dbg !23
  %2 = load i8*, i8** %data, align 8, !dbg !24
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !25
  %3 = load i8*, i8** %data, align 8, !dbg !26
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !26
  store i8 0, i8* %arrayidx, align 1, !dbg !27
  call void @llvm.dbg.declare(metadata i8** %dataCopy, metadata !28, metadata !DIExpression()), !dbg !30
  %4 = load i8*, i8** %data, align 8, !dbg !31
  store i8* %4, i8** %dataCopy, align 8, !dbg !30
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !32, metadata !DIExpression()), !dbg !33
  %5 = load i8*, i8** %dataCopy, align 8, !dbg !34
  store i8* %5, i8** %data1, align 8, !dbg !33
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !35, metadata !DIExpression()), !dbg !40
  %6 = bitcast [50 x i8]* %dest to i8*, !dbg !40
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 50, i1 false), !dbg !40
  call void @llvm.dbg.declare(metadata i64* %i, metadata !41, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !46, metadata !DIExpression()), !dbg !47
  %7 = load i8*, i8** %data1, align 8, !dbg !48
  %call = call i64 @strlen(i8* %7) #6, !dbg !49
  store i64 %call, i64* %dataLen, align 8, !dbg !50
  store i64 0, i64* %i, align 8, !dbg !51
  br label %for.cond, !dbg !53

for.cond:                                         ; preds = %for.inc, %entry
  %8 = load i64, i64* %i, align 8, !dbg !54
  %9 = load i64, i64* %dataLen, align 8, !dbg !56
  %cmp = icmp ult i64 %8, %9, !dbg !57
  br i1 %cmp, label %for.body, label %for.end, !dbg !58

for.body:                                         ; preds = %for.cond
  %10 = load i8*, i8** %data1, align 8, !dbg !59
  %11 = load i64, i64* %i, align 8, !dbg !61
  %arrayidx2 = getelementptr inbounds i8, i8* %10, i64 %11, !dbg !59
  %12 = load i8, i8* %arrayidx2, align 1, !dbg !59
  %13 = load i64, i64* %i, align 8, !dbg !62
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %13, !dbg !63
  store i8 %12, i8* %arrayidx3, align 1, !dbg !64
  br label %for.inc, !dbg !65

for.inc:                                          ; preds = %for.body
  %14 = load i64, i64* %i, align 8, !dbg !66
  %inc = add i64 %14, 1, !dbg !66
  store i64 %inc, i64* %i, align 8, !dbg !66
  br label %for.cond, !dbg !67, !llvm.loop !68

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !71
  store i8 0, i8* %arrayidx4, align 1, !dbg !72
  %15 = load i8*, i8** %data1, align 8, !dbg !73
  call void @printLine(i8* %15), !dbg !74
  ret void, !dbg !75
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_31_good() #0 !dbg !76 {
entry:
  call void @goodG2B(), !dbg !77
  ret void, !dbg !78
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !79 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !84, metadata !DIExpression()), !dbg !85
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !86, metadata !DIExpression()), !dbg !87
  %call = call i64 @time(i64* null) #7, !dbg !88
  %conv = trunc i64 %call to i32, !dbg !89
  call void @srand(i32 %conv) #7, !dbg !90
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !91
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_31_good(), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !94
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_31_bad(), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !96
  ret i32 0, !dbg !97
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !98 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dataCopy = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !99, metadata !DIExpression()), !dbg !100
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !101, metadata !DIExpression()), !dbg !102
  %0 = alloca i8, i64 100, align 16, !dbg !103
  store i8* %0, i8** %dataBuffer, align 8, !dbg !102
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !104
  store i8* %1, i8** %data, align 8, !dbg !105
  %2 = load i8*, i8** %data, align 8, !dbg !106
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !107
  %3 = load i8*, i8** %data, align 8, !dbg !108
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !108
  store i8 0, i8* %arrayidx, align 1, !dbg !109
  call void @llvm.dbg.declare(metadata i8** %dataCopy, metadata !110, metadata !DIExpression()), !dbg !112
  %4 = load i8*, i8** %data, align 8, !dbg !113
  store i8* %4, i8** %dataCopy, align 8, !dbg !112
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !114, metadata !DIExpression()), !dbg !115
  %5 = load i8*, i8** %dataCopy, align 8, !dbg !116
  store i8* %5, i8** %data1, align 8, !dbg !115
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !117, metadata !DIExpression()), !dbg !119
  %6 = bitcast [50 x i8]* %dest to i8*, !dbg !119
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 50, i1 false), !dbg !119
  call void @llvm.dbg.declare(metadata i64* %i, metadata !120, metadata !DIExpression()), !dbg !121
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !122, metadata !DIExpression()), !dbg !123
  %7 = load i8*, i8** %data1, align 8, !dbg !124
  %call = call i64 @strlen(i8* %7) #6, !dbg !125
  store i64 %call, i64* %dataLen, align 8, !dbg !126
  store i64 0, i64* %i, align 8, !dbg !127
  br label %for.cond, !dbg !129

for.cond:                                         ; preds = %for.inc, %entry
  %8 = load i64, i64* %i, align 8, !dbg !130
  %9 = load i64, i64* %dataLen, align 8, !dbg !132
  %cmp = icmp ult i64 %8, %9, !dbg !133
  br i1 %cmp, label %for.body, label %for.end, !dbg !134

for.body:                                         ; preds = %for.cond
  %10 = load i8*, i8** %data1, align 8, !dbg !135
  %11 = load i64, i64* %i, align 8, !dbg !137
  %arrayidx2 = getelementptr inbounds i8, i8* %10, i64 %11, !dbg !135
  %12 = load i8, i8* %arrayidx2, align 1, !dbg !135
  %13 = load i64, i64* %i, align 8, !dbg !138
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %13, !dbg !139
  store i8 %12, i8* %arrayidx3, align 1, !dbg !140
  br label %for.inc, !dbg !141

for.inc:                                          ; preds = %for.body
  %14 = load i64, i64* %i, align 8, !dbg !142
  %inc = add i64 %14, 1, !dbg !142
  store i64 %inc, i64* %i, align 8, !dbg !142
  br label %for.cond, !dbg !143, !llvm.loop !144

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !146
  store i8 0, i8* %arrayidx4, align 1, !dbg !147
  %15 = load i8*, i8** %data1, align 8, !dbg !148
  call void @printLine(i8* %15), !dbg !149
  ret void, !dbg !150
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_31.c", directory: "/root/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_31_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_31.c", directory: "/root/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 25, type: !4)
!18 = !DILocation(line: 25, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataBuffer", scope: !13, file: !14, line: 26, type: !4)
!20 = !DILocation(line: 26, column: 12, scope: !13)
!21 = !DILocation(line: 26, column: 33, scope: !13)
!22 = !DILocation(line: 27, column: 12, scope: !13)
!23 = !DILocation(line: 27, column: 10, scope: !13)
!24 = !DILocation(line: 29, column: 12, scope: !13)
!25 = !DILocation(line: 29, column: 5, scope: !13)
!26 = !DILocation(line: 30, column: 5, scope: !13)
!27 = !DILocation(line: 30, column: 17, scope: !13)
!28 = !DILocalVariable(name: "dataCopy", scope: !29, file: !14, line: 32, type: !4)
!29 = distinct !DILexicalBlock(scope: !13, file: !14, line: 31, column: 5)
!30 = !DILocation(line: 32, column: 16, scope: !29)
!31 = !DILocation(line: 32, column: 27, scope: !29)
!32 = !DILocalVariable(name: "data", scope: !29, file: !14, line: 33, type: !4)
!33 = !DILocation(line: 33, column: 16, scope: !29)
!34 = !DILocation(line: 33, column: 23, scope: !29)
!35 = !DILocalVariable(name: "dest", scope: !36, file: !14, line: 35, type: !37)
!36 = distinct !DILexicalBlock(scope: !29, file: !14, line: 34, column: 9)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 50)
!40 = !DILocation(line: 35, column: 18, scope: !36)
!41 = !DILocalVariable(name: "i", scope: !36, file: !14, line: 36, type: !42)
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !43, line: 46, baseType: !44)
!43 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!44 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!45 = !DILocation(line: 36, column: 20, scope: !36)
!46 = !DILocalVariable(name: "dataLen", scope: !36, file: !14, line: 36, type: !42)
!47 = !DILocation(line: 36, column: 23, scope: !36)
!48 = !DILocation(line: 37, column: 30, scope: !36)
!49 = !DILocation(line: 37, column: 23, scope: !36)
!50 = !DILocation(line: 37, column: 21, scope: !36)
!51 = !DILocation(line: 39, column: 20, scope: !52)
!52 = distinct !DILexicalBlock(scope: !36, file: !14, line: 39, column: 13)
!53 = !DILocation(line: 39, column: 18, scope: !52)
!54 = !DILocation(line: 39, column: 25, scope: !55)
!55 = distinct !DILexicalBlock(scope: !52, file: !14, line: 39, column: 13)
!56 = !DILocation(line: 39, column: 29, scope: !55)
!57 = !DILocation(line: 39, column: 27, scope: !55)
!58 = !DILocation(line: 39, column: 13, scope: !52)
!59 = !DILocation(line: 41, column: 27, scope: !60)
!60 = distinct !DILexicalBlock(scope: !55, file: !14, line: 40, column: 13)
!61 = !DILocation(line: 41, column: 32, scope: !60)
!62 = !DILocation(line: 41, column: 22, scope: !60)
!63 = !DILocation(line: 41, column: 17, scope: !60)
!64 = !DILocation(line: 41, column: 25, scope: !60)
!65 = !DILocation(line: 42, column: 13, scope: !60)
!66 = !DILocation(line: 39, column: 39, scope: !55)
!67 = !DILocation(line: 39, column: 13, scope: !55)
!68 = distinct !{!68, !58, !69, !70}
!69 = !DILocation(line: 42, column: 13, scope: !52)
!70 = !{!"llvm.loop.mustprogress"}
!71 = !DILocation(line: 43, column: 13, scope: !36)
!72 = !DILocation(line: 43, column: 24, scope: !36)
!73 = !DILocation(line: 44, column: 23, scope: !36)
!74 = !DILocation(line: 44, column: 13, scope: !36)
!75 = !DILocation(line: 47, column: 1, scope: !13)
!76 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_31_good", scope: !14, file: !14, line: 80, type: !15, scopeLine: 81, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DILocation(line: 82, column: 5, scope: !76)
!78 = !DILocation(line: 83, column: 1, scope: !76)
!79 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 94, type: !80, scopeLine: 95, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DISubroutineType(types: !81)
!81 = !{!82, !82, !83}
!82 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!84 = !DILocalVariable(name: "argc", arg: 1, scope: !79, file: !14, line: 94, type: !82)
!85 = !DILocation(line: 94, column: 14, scope: !79)
!86 = !DILocalVariable(name: "argv", arg: 2, scope: !79, file: !14, line: 94, type: !83)
!87 = !DILocation(line: 94, column: 27, scope: !79)
!88 = !DILocation(line: 97, column: 22, scope: !79)
!89 = !DILocation(line: 97, column: 12, scope: !79)
!90 = !DILocation(line: 97, column: 5, scope: !79)
!91 = !DILocation(line: 99, column: 5, scope: !79)
!92 = !DILocation(line: 100, column: 5, scope: !79)
!93 = !DILocation(line: 101, column: 5, scope: !79)
!94 = !DILocation(line: 104, column: 5, scope: !79)
!95 = !DILocation(line: 105, column: 5, scope: !79)
!96 = !DILocation(line: 106, column: 5, scope: !79)
!97 = !DILocation(line: 108, column: 5, scope: !79)
!98 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 54, type: !15, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!99 = !DILocalVariable(name: "data", scope: !98, file: !14, line: 56, type: !4)
!100 = !DILocation(line: 56, column: 12, scope: !98)
!101 = !DILocalVariable(name: "dataBuffer", scope: !98, file: !14, line: 57, type: !4)
!102 = !DILocation(line: 57, column: 12, scope: !98)
!103 = !DILocation(line: 57, column: 33, scope: !98)
!104 = !DILocation(line: 58, column: 12, scope: !98)
!105 = !DILocation(line: 58, column: 10, scope: !98)
!106 = !DILocation(line: 60, column: 12, scope: !98)
!107 = !DILocation(line: 60, column: 5, scope: !98)
!108 = !DILocation(line: 61, column: 5, scope: !98)
!109 = !DILocation(line: 61, column: 16, scope: !98)
!110 = !DILocalVariable(name: "dataCopy", scope: !111, file: !14, line: 63, type: !4)
!111 = distinct !DILexicalBlock(scope: !98, file: !14, line: 62, column: 5)
!112 = !DILocation(line: 63, column: 16, scope: !111)
!113 = !DILocation(line: 63, column: 27, scope: !111)
!114 = !DILocalVariable(name: "data", scope: !111, file: !14, line: 64, type: !4)
!115 = !DILocation(line: 64, column: 16, scope: !111)
!116 = !DILocation(line: 64, column: 23, scope: !111)
!117 = !DILocalVariable(name: "dest", scope: !118, file: !14, line: 66, type: !37)
!118 = distinct !DILexicalBlock(scope: !111, file: !14, line: 65, column: 9)
!119 = !DILocation(line: 66, column: 18, scope: !118)
!120 = !DILocalVariable(name: "i", scope: !118, file: !14, line: 67, type: !42)
!121 = !DILocation(line: 67, column: 20, scope: !118)
!122 = !DILocalVariable(name: "dataLen", scope: !118, file: !14, line: 67, type: !42)
!123 = !DILocation(line: 67, column: 23, scope: !118)
!124 = !DILocation(line: 68, column: 30, scope: !118)
!125 = !DILocation(line: 68, column: 23, scope: !118)
!126 = !DILocation(line: 68, column: 21, scope: !118)
!127 = !DILocation(line: 70, column: 20, scope: !128)
!128 = distinct !DILexicalBlock(scope: !118, file: !14, line: 70, column: 13)
!129 = !DILocation(line: 70, column: 18, scope: !128)
!130 = !DILocation(line: 70, column: 25, scope: !131)
!131 = distinct !DILexicalBlock(scope: !128, file: !14, line: 70, column: 13)
!132 = !DILocation(line: 70, column: 29, scope: !131)
!133 = !DILocation(line: 70, column: 27, scope: !131)
!134 = !DILocation(line: 70, column: 13, scope: !128)
!135 = !DILocation(line: 72, column: 27, scope: !136)
!136 = distinct !DILexicalBlock(scope: !131, file: !14, line: 71, column: 13)
!137 = !DILocation(line: 72, column: 32, scope: !136)
!138 = !DILocation(line: 72, column: 22, scope: !136)
!139 = !DILocation(line: 72, column: 17, scope: !136)
!140 = !DILocation(line: 72, column: 25, scope: !136)
!141 = !DILocation(line: 73, column: 13, scope: !136)
!142 = !DILocation(line: 70, column: 39, scope: !131)
!143 = !DILocation(line: 70, column: 13, scope: !131)
!144 = distinct !{!144, !134, !145, !70}
!145 = !DILocation(line: 73, column: 13, scope: !128)
!146 = !DILocation(line: 74, column: 13, scope: !118)
!147 = !DILocation(line: 74, column: 24, scope: !118)
!148 = !DILocation(line: 75, column: 23, scope: !118)
!149 = !DILocation(line: 75, column: 13, scope: !118)
!150 = !DILocation(line: 78, column: 1, scope: !98)

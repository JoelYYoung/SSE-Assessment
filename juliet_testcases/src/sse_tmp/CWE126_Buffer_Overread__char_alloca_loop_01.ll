; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_loop_01.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_loop_01.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_alloca_loop_01_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = alloca i8, i64 50, align 16, !dbg !21
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !20
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !22, metadata !DIExpression()), !dbg !23
  %1 = alloca i8, i64 100, align 16, !dbg !24
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !23
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !25
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !26
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !27
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !27
  store i8 0, i8* %arrayidx, align 1, !dbg !28
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 65, i64 99, i1 false), !dbg !30
  %5 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !31
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !31
  store i8 0, i8* %arrayidx1, align 1, !dbg !32
  %6 = load i8*, i8** %dataBadBuffer, align 8, !dbg !33
  store i8* %6, i8** %data, align 8, !dbg !34
  call void @llvm.dbg.declare(metadata i64* %i, metadata !35, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !41, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !43, metadata !DIExpression()), !dbg !47
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !48
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !48
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !49
  store i8 0, i8* %arrayidx2, align 1, !dbg !50
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !51
  %call = call i64 @strlen(i8* %arraydecay3) #6, !dbg !52
  store i64 %call, i64* %destLen, align 8, !dbg !53
  store i64 0, i64* %i, align 8, !dbg !54
  br label %for.cond, !dbg !56

for.cond:                                         ; preds = %for.inc, %entry
  %7 = load i64, i64* %i, align 8, !dbg !57
  %8 = load i64, i64* %destLen, align 8, !dbg !59
  %cmp = icmp ult i64 %7, %8, !dbg !60
  br i1 %cmp, label %for.body, label %for.end, !dbg !61

for.body:                                         ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !62
  %10 = load i64, i64* %i, align 8, !dbg !64
  %arrayidx4 = getelementptr inbounds i8, i8* %9, i64 %10, !dbg !62
  %11 = load i8, i8* %arrayidx4, align 1, !dbg !62
  %12 = load i64, i64* %i, align 8, !dbg !65
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %12, !dbg !66
  store i8 %11, i8* %arrayidx5, align 1, !dbg !67
  br label %for.inc, !dbg !68

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !69
  %inc = add i64 %13, 1, !dbg !69
  store i64 %inc, i64* %i, align 8, !dbg !69
  br label %for.cond, !dbg !70, !llvm.loop !71

for.end:                                          ; preds = %for.cond
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !74
  store i8 0, i8* %arrayidx6, align 1, !dbg !75
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !76
  call void @printLine(i8* %arraydecay7), !dbg !77
  ret void, !dbg !78
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_alloca_loop_01_good() #0 !dbg !79 {
entry:
  call void @goodG2B(), !dbg !80
  ret void, !dbg !81
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !82 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !87, metadata !DIExpression()), !dbg !88
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !89, metadata !DIExpression()), !dbg !90
  %call = call i64 @time(i64* null) #7, !dbg !91
  %conv = trunc i64 %call to i32, !dbg !92
  call void @srand(i32 %conv) #7, !dbg !93
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !94
  call void @CWE126_Buffer_Overread__char_alloca_loop_01_good(), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !96
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !97
  call void @CWE126_Buffer_Overread__char_alloca_loop_01_bad(), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !99
  ret i32 0, !dbg !100
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !101 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !102, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !104, metadata !DIExpression()), !dbg !105
  %0 = alloca i8, i64 50, align 16, !dbg !106
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !105
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !107, metadata !DIExpression()), !dbg !108
  %1 = alloca i8, i64 100, align 16, !dbg !109
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !108
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !110
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !111
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !112
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !112
  store i8 0, i8* %arrayidx, align 1, !dbg !113
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !114
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 65, i64 99, i1 false), !dbg !115
  %5 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !116
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !116
  store i8 0, i8* %arrayidx1, align 1, !dbg !117
  %6 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !118
  store i8* %6, i8** %data, align 8, !dbg !119
  call void @llvm.dbg.declare(metadata i64* %i, metadata !120, metadata !DIExpression()), !dbg !122
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !123, metadata !DIExpression()), !dbg !124
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !125, metadata !DIExpression()), !dbg !126
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !127
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !127
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !128
  store i8 0, i8* %arrayidx2, align 1, !dbg !129
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !130
  %call = call i64 @strlen(i8* %arraydecay3) #6, !dbg !131
  store i64 %call, i64* %destLen, align 8, !dbg !132
  store i64 0, i64* %i, align 8, !dbg !133
  br label %for.cond, !dbg !135

for.cond:                                         ; preds = %for.inc, %entry
  %7 = load i64, i64* %i, align 8, !dbg !136
  %8 = load i64, i64* %destLen, align 8, !dbg !138
  %cmp = icmp ult i64 %7, %8, !dbg !139
  br i1 %cmp, label %for.body, label %for.end, !dbg !140

for.body:                                         ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !141
  %10 = load i64, i64* %i, align 8, !dbg !143
  %arrayidx4 = getelementptr inbounds i8, i8* %9, i64 %10, !dbg !141
  %11 = load i8, i8* %arrayidx4, align 1, !dbg !141
  %12 = load i64, i64* %i, align 8, !dbg !144
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %12, !dbg !145
  store i8 %11, i8* %arrayidx5, align 1, !dbg !146
  br label %for.inc, !dbg !147

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !148
  %inc = add i64 %13, 1, !dbg !148
  store i64 %inc, i64* %i, align 8, !dbg !148
  br label %for.cond, !dbg !149, !llvm.loop !150

for.end:                                          ; preds = %for.cond
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !152
  store i8 0, i8* %arrayidx6, align 1, !dbg !153
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !154
  call void @printLine(i8* %arraydecay7), !dbg !155
  ret void, !dbg !156
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_loop_01.c", directory: "/root/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_loop_01_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_loop_01.c", directory: "/root/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 25, type: !4)
!18 = !DILocation(line: 25, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 26, type: !4)
!20 = !DILocation(line: 26, column: 12, scope: !13)
!21 = !DILocation(line: 26, column: 36, scope: !13)
!22 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 27, type: !4)
!23 = !DILocation(line: 27, column: 12, scope: !13)
!24 = !DILocation(line: 27, column: 37, scope: !13)
!25 = !DILocation(line: 28, column: 12, scope: !13)
!26 = !DILocation(line: 28, column: 5, scope: !13)
!27 = !DILocation(line: 29, column: 5, scope: !13)
!28 = !DILocation(line: 29, column: 25, scope: !13)
!29 = !DILocation(line: 30, column: 12, scope: !13)
!30 = !DILocation(line: 30, column: 5, scope: !13)
!31 = !DILocation(line: 31, column: 5, scope: !13)
!32 = !DILocation(line: 31, column: 27, scope: !13)
!33 = !DILocation(line: 33, column: 12, scope: !13)
!34 = !DILocation(line: 33, column: 10, scope: !13)
!35 = !DILocalVariable(name: "i", scope: !36, file: !14, line: 35, type: !37)
!36 = distinct !DILexicalBlock(scope: !13, file: !14, line: 34, column: 5)
!37 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !38, line: 46, baseType: !39)
!38 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!39 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!40 = !DILocation(line: 35, column: 16, scope: !36)
!41 = !DILocalVariable(name: "destLen", scope: !36, file: !14, line: 35, type: !37)
!42 = !DILocation(line: 35, column: 19, scope: !36)
!43 = !DILocalVariable(name: "dest", scope: !36, file: !14, line: 36, type: !44)
!44 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !45)
!45 = !{!46}
!46 = !DISubrange(count: 100)
!47 = !DILocation(line: 36, column: 14, scope: !36)
!48 = !DILocation(line: 37, column: 9, scope: !36)
!49 = !DILocation(line: 38, column: 9, scope: !36)
!50 = !DILocation(line: 38, column: 21, scope: !36)
!51 = !DILocation(line: 39, column: 26, scope: !36)
!52 = !DILocation(line: 39, column: 19, scope: !36)
!53 = !DILocation(line: 39, column: 17, scope: !36)
!54 = !DILocation(line: 42, column: 16, scope: !55)
!55 = distinct !DILexicalBlock(scope: !36, file: !14, line: 42, column: 9)
!56 = !DILocation(line: 42, column: 14, scope: !55)
!57 = !DILocation(line: 42, column: 21, scope: !58)
!58 = distinct !DILexicalBlock(scope: !55, file: !14, line: 42, column: 9)
!59 = !DILocation(line: 42, column: 25, scope: !58)
!60 = !DILocation(line: 42, column: 23, scope: !58)
!61 = !DILocation(line: 42, column: 9, scope: !55)
!62 = !DILocation(line: 44, column: 23, scope: !63)
!63 = distinct !DILexicalBlock(scope: !58, file: !14, line: 43, column: 9)
!64 = !DILocation(line: 44, column: 28, scope: !63)
!65 = !DILocation(line: 44, column: 18, scope: !63)
!66 = !DILocation(line: 44, column: 13, scope: !63)
!67 = !DILocation(line: 44, column: 21, scope: !63)
!68 = !DILocation(line: 45, column: 9, scope: !63)
!69 = !DILocation(line: 42, column: 35, scope: !58)
!70 = !DILocation(line: 42, column: 9, scope: !58)
!71 = distinct !{!71, !61, !72, !73}
!72 = !DILocation(line: 45, column: 9, scope: !55)
!73 = !{!"llvm.loop.mustprogress"}
!74 = !DILocation(line: 46, column: 9, scope: !36)
!75 = !DILocation(line: 46, column: 21, scope: !36)
!76 = !DILocation(line: 47, column: 19, scope: !36)
!77 = !DILocation(line: 47, column: 9, scope: !36)
!78 = !DILocation(line: 49, column: 1, scope: !13)
!79 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_loop_01_good", scope: !14, file: !14, line: 84, type: !15, scopeLine: 85, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DILocation(line: 86, column: 5, scope: !79)
!81 = !DILocation(line: 87, column: 1, scope: !79)
!82 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 99, type: !83, scopeLine: 100, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DISubroutineType(types: !84)
!84 = !{!85, !85, !86}
!85 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!87 = !DILocalVariable(name: "argc", arg: 1, scope: !82, file: !14, line: 99, type: !85)
!88 = !DILocation(line: 99, column: 14, scope: !82)
!89 = !DILocalVariable(name: "argv", arg: 2, scope: !82, file: !14, line: 99, type: !86)
!90 = !DILocation(line: 99, column: 27, scope: !82)
!91 = !DILocation(line: 102, column: 22, scope: !82)
!92 = !DILocation(line: 102, column: 12, scope: !82)
!93 = !DILocation(line: 102, column: 5, scope: !82)
!94 = !DILocation(line: 104, column: 5, scope: !82)
!95 = !DILocation(line: 105, column: 5, scope: !82)
!96 = !DILocation(line: 106, column: 5, scope: !82)
!97 = !DILocation(line: 109, column: 5, scope: !82)
!98 = !DILocation(line: 110, column: 5, scope: !82)
!99 = !DILocation(line: 111, column: 5, scope: !82)
!100 = !DILocation(line: 113, column: 5, scope: !82)
!101 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 56, type: !15, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!102 = !DILocalVariable(name: "data", scope: !101, file: !14, line: 58, type: !4)
!103 = !DILocation(line: 58, column: 12, scope: !101)
!104 = !DILocalVariable(name: "dataBadBuffer", scope: !101, file: !14, line: 59, type: !4)
!105 = !DILocation(line: 59, column: 12, scope: !101)
!106 = !DILocation(line: 59, column: 36, scope: !101)
!107 = !DILocalVariable(name: "dataGoodBuffer", scope: !101, file: !14, line: 60, type: !4)
!108 = !DILocation(line: 60, column: 12, scope: !101)
!109 = !DILocation(line: 60, column: 37, scope: !101)
!110 = !DILocation(line: 61, column: 12, scope: !101)
!111 = !DILocation(line: 61, column: 5, scope: !101)
!112 = !DILocation(line: 62, column: 5, scope: !101)
!113 = !DILocation(line: 62, column: 25, scope: !101)
!114 = !DILocation(line: 63, column: 12, scope: !101)
!115 = !DILocation(line: 63, column: 5, scope: !101)
!116 = !DILocation(line: 64, column: 5, scope: !101)
!117 = !DILocation(line: 64, column: 27, scope: !101)
!118 = !DILocation(line: 66, column: 12, scope: !101)
!119 = !DILocation(line: 66, column: 10, scope: !101)
!120 = !DILocalVariable(name: "i", scope: !121, file: !14, line: 68, type: !37)
!121 = distinct !DILexicalBlock(scope: !101, file: !14, line: 67, column: 5)
!122 = !DILocation(line: 68, column: 16, scope: !121)
!123 = !DILocalVariable(name: "destLen", scope: !121, file: !14, line: 68, type: !37)
!124 = !DILocation(line: 68, column: 19, scope: !121)
!125 = !DILocalVariable(name: "dest", scope: !121, file: !14, line: 69, type: !44)
!126 = !DILocation(line: 69, column: 14, scope: !121)
!127 = !DILocation(line: 70, column: 9, scope: !121)
!128 = !DILocation(line: 71, column: 9, scope: !121)
!129 = !DILocation(line: 71, column: 21, scope: !121)
!130 = !DILocation(line: 72, column: 26, scope: !121)
!131 = !DILocation(line: 72, column: 19, scope: !121)
!132 = !DILocation(line: 72, column: 17, scope: !121)
!133 = !DILocation(line: 75, column: 16, scope: !134)
!134 = distinct !DILexicalBlock(scope: !121, file: !14, line: 75, column: 9)
!135 = !DILocation(line: 75, column: 14, scope: !134)
!136 = !DILocation(line: 75, column: 21, scope: !137)
!137 = distinct !DILexicalBlock(scope: !134, file: !14, line: 75, column: 9)
!138 = !DILocation(line: 75, column: 25, scope: !137)
!139 = !DILocation(line: 75, column: 23, scope: !137)
!140 = !DILocation(line: 75, column: 9, scope: !134)
!141 = !DILocation(line: 77, column: 23, scope: !142)
!142 = distinct !DILexicalBlock(scope: !137, file: !14, line: 76, column: 9)
!143 = !DILocation(line: 77, column: 28, scope: !142)
!144 = !DILocation(line: 77, column: 18, scope: !142)
!145 = !DILocation(line: 77, column: 13, scope: !142)
!146 = !DILocation(line: 77, column: 21, scope: !142)
!147 = !DILocation(line: 78, column: 9, scope: !142)
!148 = !DILocation(line: 75, column: 35, scope: !137)
!149 = !DILocation(line: 75, column: 9, scope: !137)
!150 = distinct !{!150, !140, !151, !73}
!151 = !DILocation(line: 78, column: 9, scope: !134)
!152 = !DILocation(line: 79, column: 9, scope: !121)
!153 = !DILocation(line: 79, column: 21, scope: !121)
!154 = !DILocation(line: 80, column: 19, scope: !121)
!155 = !DILocation(line: 80, column: 9, scope: !121)
!156 = !DILocation(line: 82, column: 1, scope: !101)

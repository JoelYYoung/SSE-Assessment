; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_loop_18.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_loop_18.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_alloca_loop_18_bad() #0 !dbg !13 {
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
  br label %source, !dbg !33

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !34), !dbg !35
  %6 = load i8*, i8** %dataBadBuffer, align 8, !dbg !36
  store i8* %6, i8** %data, align 8, !dbg !37
  call void @llvm.dbg.declare(metadata i64* %i, metadata !38, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !44, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !46, metadata !DIExpression()), !dbg !50
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !51
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !51
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !52
  store i8 0, i8* %arrayidx2, align 1, !dbg !53
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !54
  %call = call i64 @strlen(i8* %arraydecay3) #6, !dbg !55
  store i64 %call, i64* %destLen, align 8, !dbg !56
  store i64 0, i64* %i, align 8, !dbg !57
  br label %for.cond, !dbg !59

for.cond:                                         ; preds = %for.inc, %source
  %7 = load i64, i64* %i, align 8, !dbg !60
  %8 = load i64, i64* %destLen, align 8, !dbg !62
  %cmp = icmp ult i64 %7, %8, !dbg !63
  br i1 %cmp, label %for.body, label %for.end, !dbg !64

for.body:                                         ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !65
  %10 = load i64, i64* %i, align 8, !dbg !67
  %arrayidx4 = getelementptr inbounds i8, i8* %9, i64 %10, !dbg !65
  %11 = load i8, i8* %arrayidx4, align 1, !dbg !65
  %12 = load i64, i64* %i, align 8, !dbg !68
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %12, !dbg !69
  store i8 %11, i8* %arrayidx5, align 1, !dbg !70
  br label %for.inc, !dbg !71

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !72
  %inc = add i64 %13, 1, !dbg !72
  store i64 %inc, i64* %i, align 8, !dbg !72
  br label %for.cond, !dbg !73, !llvm.loop !74

for.end:                                          ; preds = %for.cond
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !77
  store i8 0, i8* %arrayidx6, align 1, !dbg !78
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !79
  call void @printLine(i8* %arraydecay7), !dbg !80
  ret void, !dbg !81
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_alloca_loop_18_good() #0 !dbg !82 {
entry:
  call void @goodG2B(), !dbg !83
  ret void, !dbg !84
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !85 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !90, metadata !DIExpression()), !dbg !91
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !92, metadata !DIExpression()), !dbg !93
  %call = call i64 @time(i64* null) #7, !dbg !94
  %conv = trunc i64 %call to i32, !dbg !95
  call void @srand(i32 %conv) #7, !dbg !96
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !97
  call void @CWE126_Buffer_Overread__char_alloca_loop_18_good(), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !100
  call void @CWE126_Buffer_Overread__char_alloca_loop_18_bad(), !dbg !101
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !102
  ret i32 0, !dbg !103
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !104 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !105, metadata !DIExpression()), !dbg !106
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !107, metadata !DIExpression()), !dbg !108
  %0 = alloca i8, i64 50, align 16, !dbg !109
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !108
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !110, metadata !DIExpression()), !dbg !111
  %1 = alloca i8, i64 100, align 16, !dbg !112
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !111
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !113
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !114
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !115
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !115
  store i8 0, i8* %arrayidx, align 1, !dbg !116
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !117
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 65, i64 99, i1 false), !dbg !118
  %5 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !119
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !119
  store i8 0, i8* %arrayidx1, align 1, !dbg !120
  br label %source, !dbg !121

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !122), !dbg !123
  %6 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !124
  store i8* %6, i8** %data, align 8, !dbg !125
  call void @llvm.dbg.declare(metadata i64* %i, metadata !126, metadata !DIExpression()), !dbg !128
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !129, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !131, metadata !DIExpression()), !dbg !132
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !133
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !133
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !134
  store i8 0, i8* %arrayidx2, align 1, !dbg !135
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !136
  %call = call i64 @strlen(i8* %arraydecay3) #6, !dbg !137
  store i64 %call, i64* %destLen, align 8, !dbg !138
  store i64 0, i64* %i, align 8, !dbg !139
  br label %for.cond, !dbg !141

for.cond:                                         ; preds = %for.inc, %source
  %7 = load i64, i64* %i, align 8, !dbg !142
  %8 = load i64, i64* %destLen, align 8, !dbg !144
  %cmp = icmp ult i64 %7, %8, !dbg !145
  br i1 %cmp, label %for.body, label %for.end, !dbg !146

for.body:                                         ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !147
  %10 = load i64, i64* %i, align 8, !dbg !149
  %arrayidx4 = getelementptr inbounds i8, i8* %9, i64 %10, !dbg !147
  %11 = load i8, i8* %arrayidx4, align 1, !dbg !147
  %12 = load i64, i64* %i, align 8, !dbg !150
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %12, !dbg !151
  store i8 %11, i8* %arrayidx5, align 1, !dbg !152
  br label %for.inc, !dbg !153

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !154
  %inc = add i64 %13, 1, !dbg !154
  store i64 %inc, i64* %i, align 8, !dbg !154
  br label %for.cond, !dbg !155, !llvm.loop !156

for.end:                                          ; preds = %for.cond
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !158
  store i8 0, i8* %arrayidx6, align 1, !dbg !159
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !160
  call void @printLine(i8* %arraydecay7), !dbg !161
  ret void, !dbg !162
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_loop_18.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_loop_18_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_loop_18.c", directory: "/home/joelyang/SSE-Assessment")
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
!33 = !DILocation(line: 32, column: 5, scope: !13)
!34 = !DILabel(scope: !13, name: "source", file: !14, line: 33)
!35 = !DILocation(line: 33, column: 1, scope: !13)
!36 = !DILocation(line: 35, column: 12, scope: !13)
!37 = !DILocation(line: 35, column: 10, scope: !13)
!38 = !DILocalVariable(name: "i", scope: !39, file: !14, line: 37, type: !40)
!39 = distinct !DILexicalBlock(scope: !13, file: !14, line: 36, column: 5)
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !41, line: 46, baseType: !42)
!41 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!42 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!43 = !DILocation(line: 37, column: 16, scope: !39)
!44 = !DILocalVariable(name: "destLen", scope: !39, file: !14, line: 37, type: !40)
!45 = !DILocation(line: 37, column: 19, scope: !39)
!46 = !DILocalVariable(name: "dest", scope: !39, file: !14, line: 38, type: !47)
!47 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !48)
!48 = !{!49}
!49 = !DISubrange(count: 100)
!50 = !DILocation(line: 38, column: 14, scope: !39)
!51 = !DILocation(line: 39, column: 9, scope: !39)
!52 = !DILocation(line: 40, column: 9, scope: !39)
!53 = !DILocation(line: 40, column: 21, scope: !39)
!54 = !DILocation(line: 41, column: 26, scope: !39)
!55 = !DILocation(line: 41, column: 19, scope: !39)
!56 = !DILocation(line: 41, column: 17, scope: !39)
!57 = !DILocation(line: 44, column: 16, scope: !58)
!58 = distinct !DILexicalBlock(scope: !39, file: !14, line: 44, column: 9)
!59 = !DILocation(line: 44, column: 14, scope: !58)
!60 = !DILocation(line: 44, column: 21, scope: !61)
!61 = distinct !DILexicalBlock(scope: !58, file: !14, line: 44, column: 9)
!62 = !DILocation(line: 44, column: 25, scope: !61)
!63 = !DILocation(line: 44, column: 23, scope: !61)
!64 = !DILocation(line: 44, column: 9, scope: !58)
!65 = !DILocation(line: 46, column: 23, scope: !66)
!66 = distinct !DILexicalBlock(scope: !61, file: !14, line: 45, column: 9)
!67 = !DILocation(line: 46, column: 28, scope: !66)
!68 = !DILocation(line: 46, column: 18, scope: !66)
!69 = !DILocation(line: 46, column: 13, scope: !66)
!70 = !DILocation(line: 46, column: 21, scope: !66)
!71 = !DILocation(line: 47, column: 9, scope: !66)
!72 = !DILocation(line: 44, column: 35, scope: !61)
!73 = !DILocation(line: 44, column: 9, scope: !61)
!74 = distinct !{!74, !64, !75, !76}
!75 = !DILocation(line: 47, column: 9, scope: !58)
!76 = !{!"llvm.loop.mustprogress"}
!77 = !DILocation(line: 48, column: 9, scope: !39)
!78 = !DILocation(line: 48, column: 21, scope: !39)
!79 = !DILocation(line: 49, column: 19, scope: !39)
!80 = !DILocation(line: 49, column: 9, scope: !39)
!81 = !DILocation(line: 51, column: 1, scope: !13)
!82 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_loop_18_good", scope: !14, file: !14, line: 88, type: !15, scopeLine: 89, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DILocation(line: 90, column: 5, scope: !82)
!84 = !DILocation(line: 91, column: 1, scope: !82)
!85 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 103, type: !86, scopeLine: 104, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DISubroutineType(types: !87)
!87 = !{!88, !88, !89}
!88 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!90 = !DILocalVariable(name: "argc", arg: 1, scope: !85, file: !14, line: 103, type: !88)
!91 = !DILocation(line: 103, column: 14, scope: !85)
!92 = !DILocalVariable(name: "argv", arg: 2, scope: !85, file: !14, line: 103, type: !89)
!93 = !DILocation(line: 103, column: 27, scope: !85)
!94 = !DILocation(line: 106, column: 22, scope: !85)
!95 = !DILocation(line: 106, column: 12, scope: !85)
!96 = !DILocation(line: 106, column: 5, scope: !85)
!97 = !DILocation(line: 108, column: 5, scope: !85)
!98 = !DILocation(line: 109, column: 5, scope: !85)
!99 = !DILocation(line: 110, column: 5, scope: !85)
!100 = !DILocation(line: 113, column: 5, scope: !85)
!101 = !DILocation(line: 114, column: 5, scope: !85)
!102 = !DILocation(line: 115, column: 5, scope: !85)
!103 = !DILocation(line: 117, column: 5, scope: !85)
!104 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 58, type: !15, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!105 = !DILocalVariable(name: "data", scope: !104, file: !14, line: 60, type: !4)
!106 = !DILocation(line: 60, column: 12, scope: !104)
!107 = !DILocalVariable(name: "dataBadBuffer", scope: !104, file: !14, line: 61, type: !4)
!108 = !DILocation(line: 61, column: 12, scope: !104)
!109 = !DILocation(line: 61, column: 36, scope: !104)
!110 = !DILocalVariable(name: "dataGoodBuffer", scope: !104, file: !14, line: 62, type: !4)
!111 = !DILocation(line: 62, column: 12, scope: !104)
!112 = !DILocation(line: 62, column: 37, scope: !104)
!113 = !DILocation(line: 63, column: 12, scope: !104)
!114 = !DILocation(line: 63, column: 5, scope: !104)
!115 = !DILocation(line: 64, column: 5, scope: !104)
!116 = !DILocation(line: 64, column: 25, scope: !104)
!117 = !DILocation(line: 65, column: 12, scope: !104)
!118 = !DILocation(line: 65, column: 5, scope: !104)
!119 = !DILocation(line: 66, column: 5, scope: !104)
!120 = !DILocation(line: 66, column: 27, scope: !104)
!121 = !DILocation(line: 67, column: 5, scope: !104)
!122 = !DILabel(scope: !104, name: "source", file: !14, line: 68)
!123 = !DILocation(line: 68, column: 1, scope: !104)
!124 = !DILocation(line: 70, column: 12, scope: !104)
!125 = !DILocation(line: 70, column: 10, scope: !104)
!126 = !DILocalVariable(name: "i", scope: !127, file: !14, line: 72, type: !40)
!127 = distinct !DILexicalBlock(scope: !104, file: !14, line: 71, column: 5)
!128 = !DILocation(line: 72, column: 16, scope: !127)
!129 = !DILocalVariable(name: "destLen", scope: !127, file: !14, line: 72, type: !40)
!130 = !DILocation(line: 72, column: 19, scope: !127)
!131 = !DILocalVariable(name: "dest", scope: !127, file: !14, line: 73, type: !47)
!132 = !DILocation(line: 73, column: 14, scope: !127)
!133 = !DILocation(line: 74, column: 9, scope: !127)
!134 = !DILocation(line: 75, column: 9, scope: !127)
!135 = !DILocation(line: 75, column: 21, scope: !127)
!136 = !DILocation(line: 76, column: 26, scope: !127)
!137 = !DILocation(line: 76, column: 19, scope: !127)
!138 = !DILocation(line: 76, column: 17, scope: !127)
!139 = !DILocation(line: 79, column: 16, scope: !140)
!140 = distinct !DILexicalBlock(scope: !127, file: !14, line: 79, column: 9)
!141 = !DILocation(line: 79, column: 14, scope: !140)
!142 = !DILocation(line: 79, column: 21, scope: !143)
!143 = distinct !DILexicalBlock(scope: !140, file: !14, line: 79, column: 9)
!144 = !DILocation(line: 79, column: 25, scope: !143)
!145 = !DILocation(line: 79, column: 23, scope: !143)
!146 = !DILocation(line: 79, column: 9, scope: !140)
!147 = !DILocation(line: 81, column: 23, scope: !148)
!148 = distinct !DILexicalBlock(scope: !143, file: !14, line: 80, column: 9)
!149 = !DILocation(line: 81, column: 28, scope: !148)
!150 = !DILocation(line: 81, column: 18, scope: !148)
!151 = !DILocation(line: 81, column: 13, scope: !148)
!152 = !DILocation(line: 81, column: 21, scope: !148)
!153 = !DILocation(line: 82, column: 9, scope: !148)
!154 = !DILocation(line: 79, column: 35, scope: !143)
!155 = !DILocation(line: 79, column: 9, scope: !143)
!156 = distinct !{!156, !146, !157, !76}
!157 = !DILocation(line: 82, column: 9, scope: !140)
!158 = !DILocation(line: 83, column: 9, scope: !127)
!159 = !DILocation(line: 83, column: 21, scope: !127)
!160 = !DILocation(line: 84, column: 19, scope: !127)
!161 = !DILocation(line: 84, column: 9, scope: !127)
!162 = !DILocation(line: 86, column: 1, scope: !104)

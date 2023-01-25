; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_loop_34.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_loop_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.CWE126_Buffer_Overread__char_alloca_loop_34_unionType = type { i8* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_alloca_loop_34_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE126_Buffer_Overread__char_alloca_loop_34_unionType, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata %union.CWE126_Buffer_Overread__char_alloca_loop_34_unionType* %myUnion, metadata !19, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !26, metadata !DIExpression()), !dbg !27
  %0 = alloca i8, i64 50, align 16, !dbg !28
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !29, metadata !DIExpression()), !dbg !30
  %1 = alloca i8, i64 100, align 16, !dbg !31
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !30
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !32
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !33
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !34
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !34
  store i8 0, i8* %arrayidx, align 1, !dbg !35
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !36
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 65, i64 99, i1 false), !dbg !37
  %5 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !38
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !38
  store i8 0, i8* %arrayidx1, align 1, !dbg !39
  %6 = load i8*, i8** %dataBadBuffer, align 8, !dbg !40
  store i8* %6, i8** %data, align 8, !dbg !41
  %7 = load i8*, i8** %data, align 8, !dbg !42
  %unionFirst = bitcast %union.CWE126_Buffer_Overread__char_alloca_loop_34_unionType* %myUnion to i8**, !dbg !43
  store i8* %7, i8** %unionFirst, align 8, !dbg !44
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !45, metadata !DIExpression()), !dbg !47
  %unionSecond = bitcast %union.CWE126_Buffer_Overread__char_alloca_loop_34_unionType* %myUnion to i8**, !dbg !48
  %8 = load i8*, i8** %unionSecond, align 8, !dbg !48
  store i8* %8, i8** %data2, align 8, !dbg !47
  call void @llvm.dbg.declare(metadata i64* %i, metadata !49, metadata !DIExpression()), !dbg !54
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !55, metadata !DIExpression()), !dbg !56
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !57, metadata !DIExpression()), !dbg !61
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !62
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !62
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !63
  store i8 0, i8* %arrayidx3, align 1, !dbg !64
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !65
  %call = call i64 @strlen(i8* %arraydecay4) #6, !dbg !66
  store i64 %call, i64* %destLen, align 8, !dbg !67
  store i64 0, i64* %i, align 8, !dbg !68
  br label %for.cond, !dbg !70

for.cond:                                         ; preds = %for.inc, %entry
  %9 = load i64, i64* %i, align 8, !dbg !71
  %10 = load i64, i64* %destLen, align 8, !dbg !73
  %cmp = icmp ult i64 %9, %10, !dbg !74
  br i1 %cmp, label %for.body, label %for.end, !dbg !75

for.body:                                         ; preds = %for.cond
  %11 = load i8*, i8** %data2, align 8, !dbg !76
  %12 = load i64, i64* %i, align 8, !dbg !78
  %arrayidx5 = getelementptr inbounds i8, i8* %11, i64 %12, !dbg !76
  %13 = load i8, i8* %arrayidx5, align 1, !dbg !76
  %14 = load i64, i64* %i, align 8, !dbg !79
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %14, !dbg !80
  store i8 %13, i8* %arrayidx6, align 1, !dbg !81
  br label %for.inc, !dbg !82

for.inc:                                          ; preds = %for.body
  %15 = load i64, i64* %i, align 8, !dbg !83
  %inc = add i64 %15, 1, !dbg !83
  store i64 %inc, i64* %i, align 8, !dbg !83
  br label %for.cond, !dbg !84, !llvm.loop !85

for.end:                                          ; preds = %for.cond
  %arrayidx7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !88
  store i8 0, i8* %arrayidx7, align 1, !dbg !89
  %arraydecay8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !90
  call void @printLine(i8* %arraydecay8), !dbg !91
  ret void, !dbg !92
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_alloca_loop_34_good() #0 !dbg !93 {
entry:
  call void @goodG2B(), !dbg !94
  ret void, !dbg !95
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !96 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !101, metadata !DIExpression()), !dbg !102
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !103, metadata !DIExpression()), !dbg !104
  %call = call i64 @time(i64* null) #7, !dbg !105
  %conv = trunc i64 %call to i32, !dbg !106
  call void @srand(i32 %conv) #7, !dbg !107
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !108
  call void @CWE126_Buffer_Overread__char_alloca_loop_34_good(), !dbg !109
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !110
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !111
  call void @CWE126_Buffer_Overread__char_alloca_loop_34_bad(), !dbg !112
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !113
  ret i32 0, !dbg !114
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !115 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE126_Buffer_Overread__char_alloca_loop_34_unionType, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !116, metadata !DIExpression()), !dbg !117
  call void @llvm.dbg.declare(metadata %union.CWE126_Buffer_Overread__char_alloca_loop_34_unionType* %myUnion, metadata !118, metadata !DIExpression()), !dbg !119
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !120, metadata !DIExpression()), !dbg !121
  %0 = alloca i8, i64 50, align 16, !dbg !122
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !121
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !123, metadata !DIExpression()), !dbg !124
  %1 = alloca i8, i64 100, align 16, !dbg !125
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !124
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !126
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !127
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !128
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !128
  store i8 0, i8* %arrayidx, align 1, !dbg !129
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !130
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 65, i64 99, i1 false), !dbg !131
  %5 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !132
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !132
  store i8 0, i8* %arrayidx1, align 1, !dbg !133
  %6 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !134
  store i8* %6, i8** %data, align 8, !dbg !135
  %7 = load i8*, i8** %data, align 8, !dbg !136
  %unionFirst = bitcast %union.CWE126_Buffer_Overread__char_alloca_loop_34_unionType* %myUnion to i8**, !dbg !137
  store i8* %7, i8** %unionFirst, align 8, !dbg !138
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !139, metadata !DIExpression()), !dbg !141
  %unionSecond = bitcast %union.CWE126_Buffer_Overread__char_alloca_loop_34_unionType* %myUnion to i8**, !dbg !142
  %8 = load i8*, i8** %unionSecond, align 8, !dbg !142
  store i8* %8, i8** %data2, align 8, !dbg !141
  call void @llvm.dbg.declare(metadata i64* %i, metadata !143, metadata !DIExpression()), !dbg !145
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !146, metadata !DIExpression()), !dbg !147
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !148, metadata !DIExpression()), !dbg !149
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !150
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !150
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !151
  store i8 0, i8* %arrayidx3, align 1, !dbg !152
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !153
  %call = call i64 @strlen(i8* %arraydecay4) #6, !dbg !154
  store i64 %call, i64* %destLen, align 8, !dbg !155
  store i64 0, i64* %i, align 8, !dbg !156
  br label %for.cond, !dbg !158

for.cond:                                         ; preds = %for.inc, %entry
  %9 = load i64, i64* %i, align 8, !dbg !159
  %10 = load i64, i64* %destLen, align 8, !dbg !161
  %cmp = icmp ult i64 %9, %10, !dbg !162
  br i1 %cmp, label %for.body, label %for.end, !dbg !163

for.body:                                         ; preds = %for.cond
  %11 = load i8*, i8** %data2, align 8, !dbg !164
  %12 = load i64, i64* %i, align 8, !dbg !166
  %arrayidx5 = getelementptr inbounds i8, i8* %11, i64 %12, !dbg !164
  %13 = load i8, i8* %arrayidx5, align 1, !dbg !164
  %14 = load i64, i64* %i, align 8, !dbg !167
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %14, !dbg !168
  store i8 %13, i8* %arrayidx6, align 1, !dbg !169
  br label %for.inc, !dbg !170

for.inc:                                          ; preds = %for.body
  %15 = load i64, i64* %i, align 8, !dbg !171
  %inc = add i64 %15, 1, !dbg !171
  store i64 %inc, i64* %i, align 8, !dbg !171
  br label %for.cond, !dbg !172, !llvm.loop !173

for.end:                                          ; preds = %for.cond
  %arrayidx7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !175
  store i8 0, i8* %arrayidx7, align 1, !dbg !176
  %arraydecay8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !177
  call void @printLine(i8* %arraydecay8), !dbg !178
  ret void, !dbg !179
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_loop_34.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_loop_34_bad", scope: !14, file: !14, line: 29, type: !15, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_loop_34.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 31, type: !4)
!18 = !DILocation(line: 31, column: 12, scope: !13)
!19 = !DILocalVariable(name: "myUnion", scope: !13, file: !14, line: 32, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE126_Buffer_Overread__char_alloca_loop_34_unionType", file: !14, line: 25, baseType: !21)
!21 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !14, line: 21, size: 64, elements: !22)
!22 = !{!23, !24}
!23 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !21, file: !14, line: 23, baseType: !4, size: 64)
!24 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !21, file: !14, line: 24, baseType: !4, size: 64)
!25 = !DILocation(line: 32, column: 59, scope: !13)
!26 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 33, type: !4)
!27 = !DILocation(line: 33, column: 12, scope: !13)
!28 = !DILocation(line: 33, column: 36, scope: !13)
!29 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 34, type: !4)
!30 = !DILocation(line: 34, column: 12, scope: !13)
!31 = !DILocation(line: 34, column: 37, scope: !13)
!32 = !DILocation(line: 35, column: 12, scope: !13)
!33 = !DILocation(line: 35, column: 5, scope: !13)
!34 = !DILocation(line: 36, column: 5, scope: !13)
!35 = !DILocation(line: 36, column: 25, scope: !13)
!36 = !DILocation(line: 37, column: 12, scope: !13)
!37 = !DILocation(line: 37, column: 5, scope: !13)
!38 = !DILocation(line: 38, column: 5, scope: !13)
!39 = !DILocation(line: 38, column: 27, scope: !13)
!40 = !DILocation(line: 40, column: 12, scope: !13)
!41 = !DILocation(line: 40, column: 10, scope: !13)
!42 = !DILocation(line: 41, column: 26, scope: !13)
!43 = !DILocation(line: 41, column: 13, scope: !13)
!44 = !DILocation(line: 41, column: 24, scope: !13)
!45 = !DILocalVariable(name: "data", scope: !46, file: !14, line: 43, type: !4)
!46 = distinct !DILexicalBlock(scope: !13, file: !14, line: 42, column: 5)
!47 = !DILocation(line: 43, column: 16, scope: !46)
!48 = !DILocation(line: 43, column: 31, scope: !46)
!49 = !DILocalVariable(name: "i", scope: !50, file: !14, line: 45, type: !51)
!50 = distinct !DILexicalBlock(scope: !46, file: !14, line: 44, column: 9)
!51 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !52, line: 46, baseType: !53)
!52 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!53 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!54 = !DILocation(line: 45, column: 20, scope: !50)
!55 = !DILocalVariable(name: "destLen", scope: !50, file: !14, line: 45, type: !51)
!56 = !DILocation(line: 45, column: 23, scope: !50)
!57 = !DILocalVariable(name: "dest", scope: !50, file: !14, line: 46, type: !58)
!58 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !59)
!59 = !{!60}
!60 = !DISubrange(count: 100)
!61 = !DILocation(line: 46, column: 18, scope: !50)
!62 = !DILocation(line: 47, column: 13, scope: !50)
!63 = !DILocation(line: 48, column: 13, scope: !50)
!64 = !DILocation(line: 48, column: 25, scope: !50)
!65 = !DILocation(line: 49, column: 30, scope: !50)
!66 = !DILocation(line: 49, column: 23, scope: !50)
!67 = !DILocation(line: 49, column: 21, scope: !50)
!68 = !DILocation(line: 52, column: 20, scope: !69)
!69 = distinct !DILexicalBlock(scope: !50, file: !14, line: 52, column: 13)
!70 = !DILocation(line: 52, column: 18, scope: !69)
!71 = !DILocation(line: 52, column: 25, scope: !72)
!72 = distinct !DILexicalBlock(scope: !69, file: !14, line: 52, column: 13)
!73 = !DILocation(line: 52, column: 29, scope: !72)
!74 = !DILocation(line: 52, column: 27, scope: !72)
!75 = !DILocation(line: 52, column: 13, scope: !69)
!76 = !DILocation(line: 54, column: 27, scope: !77)
!77 = distinct !DILexicalBlock(scope: !72, file: !14, line: 53, column: 13)
!78 = !DILocation(line: 54, column: 32, scope: !77)
!79 = !DILocation(line: 54, column: 22, scope: !77)
!80 = !DILocation(line: 54, column: 17, scope: !77)
!81 = !DILocation(line: 54, column: 25, scope: !77)
!82 = !DILocation(line: 55, column: 13, scope: !77)
!83 = !DILocation(line: 52, column: 39, scope: !72)
!84 = !DILocation(line: 52, column: 13, scope: !72)
!85 = distinct !{!85, !75, !86, !87}
!86 = !DILocation(line: 55, column: 13, scope: !69)
!87 = !{!"llvm.loop.mustprogress"}
!88 = !DILocation(line: 56, column: 13, scope: !50)
!89 = !DILocation(line: 56, column: 25, scope: !50)
!90 = !DILocation(line: 57, column: 23, scope: !50)
!91 = !DILocation(line: 57, column: 13, scope: !50)
!92 = !DILocation(line: 60, column: 1, scope: !13)
!93 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_loop_34_good", scope: !14, file: !14, line: 100, type: !15, scopeLine: 101, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!94 = !DILocation(line: 102, column: 5, scope: !93)
!95 = !DILocation(line: 103, column: 1, scope: !93)
!96 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 114, type: !97, scopeLine: 115, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!97 = !DISubroutineType(types: !98)
!98 = !{!99, !99, !100}
!99 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!100 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!101 = !DILocalVariable(name: "argc", arg: 1, scope: !96, file: !14, line: 114, type: !99)
!102 = !DILocation(line: 114, column: 14, scope: !96)
!103 = !DILocalVariable(name: "argv", arg: 2, scope: !96, file: !14, line: 114, type: !100)
!104 = !DILocation(line: 114, column: 27, scope: !96)
!105 = !DILocation(line: 117, column: 22, scope: !96)
!106 = !DILocation(line: 117, column: 12, scope: !96)
!107 = !DILocation(line: 117, column: 5, scope: !96)
!108 = !DILocation(line: 119, column: 5, scope: !96)
!109 = !DILocation(line: 120, column: 5, scope: !96)
!110 = !DILocation(line: 121, column: 5, scope: !96)
!111 = !DILocation(line: 124, column: 5, scope: !96)
!112 = !DILocation(line: 125, column: 5, scope: !96)
!113 = !DILocation(line: 126, column: 5, scope: !96)
!114 = !DILocation(line: 128, column: 5, scope: !96)
!115 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 67, type: !15, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!116 = !DILocalVariable(name: "data", scope: !115, file: !14, line: 69, type: !4)
!117 = !DILocation(line: 69, column: 12, scope: !115)
!118 = !DILocalVariable(name: "myUnion", scope: !115, file: !14, line: 70, type: !20)
!119 = !DILocation(line: 70, column: 59, scope: !115)
!120 = !DILocalVariable(name: "dataBadBuffer", scope: !115, file: !14, line: 71, type: !4)
!121 = !DILocation(line: 71, column: 12, scope: !115)
!122 = !DILocation(line: 71, column: 36, scope: !115)
!123 = !DILocalVariable(name: "dataGoodBuffer", scope: !115, file: !14, line: 72, type: !4)
!124 = !DILocation(line: 72, column: 12, scope: !115)
!125 = !DILocation(line: 72, column: 37, scope: !115)
!126 = !DILocation(line: 73, column: 12, scope: !115)
!127 = !DILocation(line: 73, column: 5, scope: !115)
!128 = !DILocation(line: 74, column: 5, scope: !115)
!129 = !DILocation(line: 74, column: 25, scope: !115)
!130 = !DILocation(line: 75, column: 12, scope: !115)
!131 = !DILocation(line: 75, column: 5, scope: !115)
!132 = !DILocation(line: 76, column: 5, scope: !115)
!133 = !DILocation(line: 76, column: 27, scope: !115)
!134 = !DILocation(line: 78, column: 12, scope: !115)
!135 = !DILocation(line: 78, column: 10, scope: !115)
!136 = !DILocation(line: 79, column: 26, scope: !115)
!137 = !DILocation(line: 79, column: 13, scope: !115)
!138 = !DILocation(line: 79, column: 24, scope: !115)
!139 = !DILocalVariable(name: "data", scope: !140, file: !14, line: 81, type: !4)
!140 = distinct !DILexicalBlock(scope: !115, file: !14, line: 80, column: 5)
!141 = !DILocation(line: 81, column: 16, scope: !140)
!142 = !DILocation(line: 81, column: 31, scope: !140)
!143 = !DILocalVariable(name: "i", scope: !144, file: !14, line: 83, type: !51)
!144 = distinct !DILexicalBlock(scope: !140, file: !14, line: 82, column: 9)
!145 = !DILocation(line: 83, column: 20, scope: !144)
!146 = !DILocalVariable(name: "destLen", scope: !144, file: !14, line: 83, type: !51)
!147 = !DILocation(line: 83, column: 23, scope: !144)
!148 = !DILocalVariable(name: "dest", scope: !144, file: !14, line: 84, type: !58)
!149 = !DILocation(line: 84, column: 18, scope: !144)
!150 = !DILocation(line: 85, column: 13, scope: !144)
!151 = !DILocation(line: 86, column: 13, scope: !144)
!152 = !DILocation(line: 86, column: 25, scope: !144)
!153 = !DILocation(line: 87, column: 30, scope: !144)
!154 = !DILocation(line: 87, column: 23, scope: !144)
!155 = !DILocation(line: 87, column: 21, scope: !144)
!156 = !DILocation(line: 90, column: 20, scope: !157)
!157 = distinct !DILexicalBlock(scope: !144, file: !14, line: 90, column: 13)
!158 = !DILocation(line: 90, column: 18, scope: !157)
!159 = !DILocation(line: 90, column: 25, scope: !160)
!160 = distinct !DILexicalBlock(scope: !157, file: !14, line: 90, column: 13)
!161 = !DILocation(line: 90, column: 29, scope: !160)
!162 = !DILocation(line: 90, column: 27, scope: !160)
!163 = !DILocation(line: 90, column: 13, scope: !157)
!164 = !DILocation(line: 92, column: 27, scope: !165)
!165 = distinct !DILexicalBlock(scope: !160, file: !14, line: 91, column: 13)
!166 = !DILocation(line: 92, column: 32, scope: !165)
!167 = !DILocation(line: 92, column: 22, scope: !165)
!168 = !DILocation(line: 92, column: 17, scope: !165)
!169 = !DILocation(line: 92, column: 25, scope: !165)
!170 = !DILocation(line: 93, column: 13, scope: !165)
!171 = !DILocation(line: 90, column: 39, scope: !160)
!172 = !DILocation(line: 90, column: 13, scope: !160)
!173 = distinct !{!173, !163, !174, !87}
!174 = !DILocation(line: 93, column: 13, scope: !157)
!175 = !DILocation(line: 94, column: 13, scope: !144)
!176 = !DILocation(line: 94, column: 25, scope: !144)
!177 = !DILocation(line: 95, column: 23, scope: !144)
!178 = !DILocation(line: 95, column: 13, scope: !144)
!179 = !DILocation(line: 98, column: 1, scope: !115)

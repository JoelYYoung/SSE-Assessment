; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__char_declare_loop_32.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__char_declare_loop_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_declare_loop_32_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %data3 = alloca i8*, align 8
  %data5 = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !19, metadata !DIExpression()), !dbg !21
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !21
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !22, metadata !DIExpression()), !dbg !23
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !29, metadata !DIExpression()), !dbg !33
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !34
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !34
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !35
  store i8 0, i8* %arrayidx, align 1, !dbg !36
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !37
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !37
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !38
  store i8 0, i8* %arrayidx2, align 1, !dbg !39
  call void @llvm.dbg.declare(metadata i8** %data3, metadata !40, metadata !DIExpression()), !dbg !42
  %0 = load i8**, i8*** %dataPtr1, align 8, !dbg !43
  %1 = load i8*, i8** %0, align 8, !dbg !44
  store i8* %1, i8** %data3, align 8, !dbg !42
  %arraydecay4 = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !45
  store i8* %arraydecay4, i8** %data3, align 8, !dbg !46
  %2 = load i8*, i8** %data3, align 8, !dbg !47
  %3 = load i8**, i8*** %dataPtr1, align 8, !dbg !48
  store i8* %2, i8** %3, align 8, !dbg !49
  call void @llvm.dbg.declare(metadata i8** %data5, metadata !50, metadata !DIExpression()), !dbg !52
  %4 = load i8**, i8*** %dataPtr2, align 8, !dbg !53
  %5 = load i8*, i8** %4, align 8, !dbg !54
  store i8* %5, i8** %data5, align 8, !dbg !52
  call void @llvm.dbg.declare(metadata i64* %i, metadata !55, metadata !DIExpression()), !dbg !60
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !61, metadata !DIExpression()), !dbg !62
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !63, metadata !DIExpression()), !dbg !64
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !65
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay6, i8 67, i64 99, i1 false), !dbg !65
  %arrayidx7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !66
  store i8 0, i8* %arrayidx7, align 1, !dbg !67
  %arraydecay8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !68
  %call = call i64 @strlen(i8* %arraydecay8) #6, !dbg !69
  store i64 %call, i64* %destLen, align 8, !dbg !70
  store i64 0, i64* %i, align 8, !dbg !71
  br label %for.cond, !dbg !73

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !74
  %7 = load i64, i64* %destLen, align 8, !dbg !76
  %cmp = icmp ult i64 %6, %7, !dbg !77
  br i1 %cmp, label %for.body, label %for.end, !dbg !78

for.body:                                         ; preds = %for.cond
  %8 = load i8*, i8** %data5, align 8, !dbg !79
  %9 = load i64, i64* %i, align 8, !dbg !81
  %arrayidx9 = getelementptr inbounds i8, i8* %8, i64 %9, !dbg !79
  %10 = load i8, i8* %arrayidx9, align 1, !dbg !79
  %11 = load i64, i64* %i, align 8, !dbg !82
  %arrayidx10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %11, !dbg !83
  store i8 %10, i8* %arrayidx10, align 1, !dbg !84
  br label %for.inc, !dbg !85

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !86
  %inc = add i64 %12, 1, !dbg !86
  store i64 %inc, i64* %i, align 8, !dbg !86
  br label %for.cond, !dbg !87, !llvm.loop !88

for.end:                                          ; preds = %for.cond
  %arrayidx11 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !91
  store i8 0, i8* %arrayidx11, align 1, !dbg !92
  %arraydecay12 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !93
  call void @printLine(i8* %arraydecay12), !dbg !94
  ret void, !dbg !95
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_declare_loop_32_good() #0 !dbg !96 {
entry:
  call void @goodG2B(), !dbg !97
  ret void, !dbg !98
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !99 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !103, metadata !DIExpression()), !dbg !104
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !105, metadata !DIExpression()), !dbg !106
  %call = call i64 @time(i64* null) #7, !dbg !107
  %conv = trunc i64 %call to i32, !dbg !108
  call void @srand(i32 %conv) #7, !dbg !109
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !110
  call void @CWE126_Buffer_Overread__char_declare_loop_32_good(), !dbg !111
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !112
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !113
  call void @CWE126_Buffer_Overread__char_declare_loop_32_bad(), !dbg !114
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !115
  ret i32 0, !dbg !116
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !117 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %data3 = alloca i8*, align 8
  %data5 = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !118, metadata !DIExpression()), !dbg !119
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !120, metadata !DIExpression()), !dbg !121
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !121
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !122, metadata !DIExpression()), !dbg !123
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !123
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !124, metadata !DIExpression()), !dbg !125
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !126, metadata !DIExpression()), !dbg !127
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !128
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !128
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !129
  store i8 0, i8* %arrayidx, align 1, !dbg !130
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !131
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !131
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !132
  store i8 0, i8* %arrayidx2, align 1, !dbg !133
  call void @llvm.dbg.declare(metadata i8** %data3, metadata !134, metadata !DIExpression()), !dbg !136
  %0 = load i8**, i8*** %dataPtr1, align 8, !dbg !137
  %1 = load i8*, i8** %0, align 8, !dbg !138
  store i8* %1, i8** %data3, align 8, !dbg !136
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !139
  store i8* %arraydecay4, i8** %data3, align 8, !dbg !140
  %2 = load i8*, i8** %data3, align 8, !dbg !141
  %3 = load i8**, i8*** %dataPtr1, align 8, !dbg !142
  store i8* %2, i8** %3, align 8, !dbg !143
  call void @llvm.dbg.declare(metadata i8** %data5, metadata !144, metadata !DIExpression()), !dbg !146
  %4 = load i8**, i8*** %dataPtr2, align 8, !dbg !147
  %5 = load i8*, i8** %4, align 8, !dbg !148
  store i8* %5, i8** %data5, align 8, !dbg !146
  call void @llvm.dbg.declare(metadata i64* %i, metadata !149, metadata !DIExpression()), !dbg !151
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !152, metadata !DIExpression()), !dbg !153
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !154, metadata !DIExpression()), !dbg !155
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !156
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay6, i8 67, i64 99, i1 false), !dbg !156
  %arrayidx7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !157
  store i8 0, i8* %arrayidx7, align 1, !dbg !158
  %arraydecay8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !159
  %call = call i64 @strlen(i8* %arraydecay8) #6, !dbg !160
  store i64 %call, i64* %destLen, align 8, !dbg !161
  store i64 0, i64* %i, align 8, !dbg !162
  br label %for.cond, !dbg !164

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !165
  %7 = load i64, i64* %destLen, align 8, !dbg !167
  %cmp = icmp ult i64 %6, %7, !dbg !168
  br i1 %cmp, label %for.body, label %for.end, !dbg !169

for.body:                                         ; preds = %for.cond
  %8 = load i8*, i8** %data5, align 8, !dbg !170
  %9 = load i64, i64* %i, align 8, !dbg !172
  %arrayidx9 = getelementptr inbounds i8, i8* %8, i64 %9, !dbg !170
  %10 = load i8, i8* %arrayidx9, align 1, !dbg !170
  %11 = load i64, i64* %i, align 8, !dbg !173
  %arrayidx10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %11, !dbg !174
  store i8 %10, i8* %arrayidx10, align 1, !dbg !175
  br label %for.inc, !dbg !176

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !177
  %inc = add i64 %12, 1, !dbg !177
  store i64 %inc, i64* %i, align 8, !dbg !177
  br label %for.cond, !dbg !178, !llvm.loop !179

for.end:                                          ; preds = %for.cond
  %arrayidx11 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !181
  store i8 0, i8* %arrayidx11, align 1, !dbg !182
  %arraydecay12 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !183
  call void @printLine(i8* %arraydecay12), !dbg !184
  ret void, !dbg !185
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
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__char_declare_loop_32.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_declare_loop_32_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__char_declare_loop_32.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 25, column: 12, scope: !11)
!19 = !DILocalVariable(name: "dataPtr1", scope: !11, file: !12, line: 26, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!21 = !DILocation(line: 26, column: 13, scope: !11)
!22 = !DILocalVariable(name: "dataPtr2", scope: !11, file: !12, line: 27, type: !20)
!23 = !DILocation(line: 27, column: 13, scope: !11)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 28, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 400, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 50)
!28 = !DILocation(line: 28, column: 10, scope: !11)
!29 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 29, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 800, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 100)
!33 = !DILocation(line: 29, column: 10, scope: !11)
!34 = !DILocation(line: 30, column: 5, scope: !11)
!35 = !DILocation(line: 31, column: 5, scope: !11)
!36 = !DILocation(line: 31, column: 25, scope: !11)
!37 = !DILocation(line: 32, column: 5, scope: !11)
!38 = !DILocation(line: 33, column: 5, scope: !11)
!39 = !DILocation(line: 33, column: 27, scope: !11)
!40 = !DILocalVariable(name: "data", scope: !41, file: !12, line: 35, type: !16)
!41 = distinct !DILexicalBlock(scope: !11, file: !12, line: 34, column: 5)
!42 = !DILocation(line: 35, column: 16, scope: !41)
!43 = !DILocation(line: 35, column: 24, scope: !41)
!44 = !DILocation(line: 35, column: 23, scope: !41)
!45 = !DILocation(line: 37, column: 16, scope: !41)
!46 = !DILocation(line: 37, column: 14, scope: !41)
!47 = !DILocation(line: 38, column: 21, scope: !41)
!48 = !DILocation(line: 38, column: 10, scope: !41)
!49 = !DILocation(line: 38, column: 19, scope: !41)
!50 = !DILocalVariable(name: "data", scope: !51, file: !12, line: 41, type: !16)
!51 = distinct !DILexicalBlock(scope: !11, file: !12, line: 40, column: 5)
!52 = !DILocation(line: 41, column: 16, scope: !51)
!53 = !DILocation(line: 41, column: 24, scope: !51)
!54 = !DILocation(line: 41, column: 23, scope: !51)
!55 = !DILocalVariable(name: "i", scope: !56, file: !12, line: 43, type: !57)
!56 = distinct !DILexicalBlock(scope: !51, file: !12, line: 42, column: 9)
!57 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !58, line: 46, baseType: !59)
!58 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!59 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!60 = !DILocation(line: 43, column: 20, scope: !56)
!61 = !DILocalVariable(name: "destLen", scope: !56, file: !12, line: 43, type: !57)
!62 = !DILocation(line: 43, column: 23, scope: !56)
!63 = !DILocalVariable(name: "dest", scope: !56, file: !12, line: 44, type: !30)
!64 = !DILocation(line: 44, column: 18, scope: !56)
!65 = !DILocation(line: 45, column: 13, scope: !56)
!66 = !DILocation(line: 46, column: 13, scope: !56)
!67 = !DILocation(line: 46, column: 25, scope: !56)
!68 = !DILocation(line: 47, column: 30, scope: !56)
!69 = !DILocation(line: 47, column: 23, scope: !56)
!70 = !DILocation(line: 47, column: 21, scope: !56)
!71 = !DILocation(line: 50, column: 20, scope: !72)
!72 = distinct !DILexicalBlock(scope: !56, file: !12, line: 50, column: 13)
!73 = !DILocation(line: 50, column: 18, scope: !72)
!74 = !DILocation(line: 50, column: 25, scope: !75)
!75 = distinct !DILexicalBlock(scope: !72, file: !12, line: 50, column: 13)
!76 = !DILocation(line: 50, column: 29, scope: !75)
!77 = !DILocation(line: 50, column: 27, scope: !75)
!78 = !DILocation(line: 50, column: 13, scope: !72)
!79 = !DILocation(line: 52, column: 27, scope: !80)
!80 = distinct !DILexicalBlock(scope: !75, file: !12, line: 51, column: 13)
!81 = !DILocation(line: 52, column: 32, scope: !80)
!82 = !DILocation(line: 52, column: 22, scope: !80)
!83 = !DILocation(line: 52, column: 17, scope: !80)
!84 = !DILocation(line: 52, column: 25, scope: !80)
!85 = !DILocation(line: 53, column: 13, scope: !80)
!86 = !DILocation(line: 50, column: 39, scope: !75)
!87 = !DILocation(line: 50, column: 13, scope: !75)
!88 = distinct !{!88, !78, !89, !90}
!89 = !DILocation(line: 53, column: 13, scope: !72)
!90 = !{!"llvm.loop.mustprogress"}
!91 = !DILocation(line: 54, column: 13, scope: !56)
!92 = !DILocation(line: 54, column: 25, scope: !56)
!93 = !DILocation(line: 55, column: 23, scope: !56)
!94 = !DILocation(line: 55, column: 13, scope: !56)
!95 = !DILocation(line: 58, column: 1, scope: !11)
!96 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_declare_loop_32_good", scope: !12, file: !12, line: 102, type: !13, scopeLine: 103, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!97 = !DILocation(line: 104, column: 5, scope: !96)
!98 = !DILocation(line: 105, column: 1, scope: !96)
!99 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 116, type: !100, scopeLine: 117, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!100 = !DISubroutineType(types: !101)
!101 = !{!102, !102, !20}
!102 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!103 = !DILocalVariable(name: "argc", arg: 1, scope: !99, file: !12, line: 116, type: !102)
!104 = !DILocation(line: 116, column: 14, scope: !99)
!105 = !DILocalVariable(name: "argv", arg: 2, scope: !99, file: !12, line: 116, type: !20)
!106 = !DILocation(line: 116, column: 27, scope: !99)
!107 = !DILocation(line: 119, column: 22, scope: !99)
!108 = !DILocation(line: 119, column: 12, scope: !99)
!109 = !DILocation(line: 119, column: 5, scope: !99)
!110 = !DILocation(line: 121, column: 5, scope: !99)
!111 = !DILocation(line: 122, column: 5, scope: !99)
!112 = !DILocation(line: 123, column: 5, scope: !99)
!113 = !DILocation(line: 126, column: 5, scope: !99)
!114 = !DILocation(line: 127, column: 5, scope: !99)
!115 = !DILocation(line: 128, column: 5, scope: !99)
!116 = !DILocation(line: 130, column: 5, scope: !99)
!117 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 65, type: !13, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!118 = !DILocalVariable(name: "data", scope: !117, file: !12, line: 67, type: !16)
!119 = !DILocation(line: 67, column: 12, scope: !117)
!120 = !DILocalVariable(name: "dataPtr1", scope: !117, file: !12, line: 68, type: !20)
!121 = !DILocation(line: 68, column: 13, scope: !117)
!122 = !DILocalVariable(name: "dataPtr2", scope: !117, file: !12, line: 69, type: !20)
!123 = !DILocation(line: 69, column: 13, scope: !117)
!124 = !DILocalVariable(name: "dataBadBuffer", scope: !117, file: !12, line: 70, type: !25)
!125 = !DILocation(line: 70, column: 10, scope: !117)
!126 = !DILocalVariable(name: "dataGoodBuffer", scope: !117, file: !12, line: 71, type: !30)
!127 = !DILocation(line: 71, column: 10, scope: !117)
!128 = !DILocation(line: 72, column: 5, scope: !117)
!129 = !DILocation(line: 73, column: 5, scope: !117)
!130 = !DILocation(line: 73, column: 25, scope: !117)
!131 = !DILocation(line: 74, column: 5, scope: !117)
!132 = !DILocation(line: 75, column: 5, scope: !117)
!133 = !DILocation(line: 75, column: 27, scope: !117)
!134 = !DILocalVariable(name: "data", scope: !135, file: !12, line: 77, type: !16)
!135 = distinct !DILexicalBlock(scope: !117, file: !12, line: 76, column: 5)
!136 = !DILocation(line: 77, column: 16, scope: !135)
!137 = !DILocation(line: 77, column: 24, scope: !135)
!138 = !DILocation(line: 77, column: 23, scope: !135)
!139 = !DILocation(line: 79, column: 16, scope: !135)
!140 = !DILocation(line: 79, column: 14, scope: !135)
!141 = !DILocation(line: 80, column: 21, scope: !135)
!142 = !DILocation(line: 80, column: 10, scope: !135)
!143 = !DILocation(line: 80, column: 19, scope: !135)
!144 = !DILocalVariable(name: "data", scope: !145, file: !12, line: 83, type: !16)
!145 = distinct !DILexicalBlock(scope: !117, file: !12, line: 82, column: 5)
!146 = !DILocation(line: 83, column: 16, scope: !145)
!147 = !DILocation(line: 83, column: 24, scope: !145)
!148 = !DILocation(line: 83, column: 23, scope: !145)
!149 = !DILocalVariable(name: "i", scope: !150, file: !12, line: 85, type: !57)
!150 = distinct !DILexicalBlock(scope: !145, file: !12, line: 84, column: 9)
!151 = !DILocation(line: 85, column: 20, scope: !150)
!152 = !DILocalVariable(name: "destLen", scope: !150, file: !12, line: 85, type: !57)
!153 = !DILocation(line: 85, column: 23, scope: !150)
!154 = !DILocalVariable(name: "dest", scope: !150, file: !12, line: 86, type: !30)
!155 = !DILocation(line: 86, column: 18, scope: !150)
!156 = !DILocation(line: 87, column: 13, scope: !150)
!157 = !DILocation(line: 88, column: 13, scope: !150)
!158 = !DILocation(line: 88, column: 25, scope: !150)
!159 = !DILocation(line: 89, column: 30, scope: !150)
!160 = !DILocation(line: 89, column: 23, scope: !150)
!161 = !DILocation(line: 89, column: 21, scope: !150)
!162 = !DILocation(line: 92, column: 20, scope: !163)
!163 = distinct !DILexicalBlock(scope: !150, file: !12, line: 92, column: 13)
!164 = !DILocation(line: 92, column: 18, scope: !163)
!165 = !DILocation(line: 92, column: 25, scope: !166)
!166 = distinct !DILexicalBlock(scope: !163, file: !12, line: 92, column: 13)
!167 = !DILocation(line: 92, column: 29, scope: !166)
!168 = !DILocation(line: 92, column: 27, scope: !166)
!169 = !DILocation(line: 92, column: 13, scope: !163)
!170 = !DILocation(line: 94, column: 27, scope: !171)
!171 = distinct !DILexicalBlock(scope: !166, file: !12, line: 93, column: 13)
!172 = !DILocation(line: 94, column: 32, scope: !171)
!173 = !DILocation(line: 94, column: 22, scope: !171)
!174 = !DILocation(line: 94, column: 17, scope: !171)
!175 = !DILocation(line: 94, column: 25, scope: !171)
!176 = !DILocation(line: 95, column: 13, scope: !171)
!177 = !DILocation(line: 92, column: 39, scope: !166)
!178 = !DILocation(line: 92, column: 13, scope: !166)
!179 = distinct !{!179, !169, !180, !90}
!180 = !DILocation(line: 95, column: 13, scope: !163)
!181 = !DILocation(line: 96, column: 13, scope: !150)
!182 = !DILocation(line: 96, column: 25, scope: !150)
!183 = !DILocation(line: 97, column: 23, scope: !150)
!184 = !DILocation(line: 97, column: 13, scope: !150)
!185 = !DILocation(line: 100, column: 1, scope: !117)

; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__char_declare_loop_15.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__char_declare_loop_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_declare_loop_15_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !29
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !30
  store i8 0, i8* %arrayidx, align 1, !dbg !31
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !32
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !32
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !33
  store i8 0, i8* %arrayidx2, align 1, !dbg !34
  %arraydecay3 = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !35
  store i8* %arraydecay3, i8** %data, align 8, !dbg !36
  call void @llvm.dbg.declare(metadata i64* %i, metadata !37, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !43, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !45, metadata !DIExpression()), !dbg !46
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !47
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay4, i8 67, i64 99, i1 false), !dbg !47
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !48
  store i8 0, i8* %arrayidx5, align 1, !dbg !49
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !50
  %call = call i64 @strlen(i8* %arraydecay6) #6, !dbg !51
  store i64 %call, i64* %destLen, align 8, !dbg !52
  store i64 0, i64* %i, align 8, !dbg !53
  br label %for.cond, !dbg !55

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !56
  %1 = load i64, i64* %destLen, align 8, !dbg !58
  %cmp = icmp ult i64 %0, %1, !dbg !59
  br i1 %cmp, label %for.body, label %for.end, !dbg !60

for.body:                                         ; preds = %for.cond
  %2 = load i8*, i8** %data, align 8, !dbg !61
  %3 = load i64, i64* %i, align 8, !dbg !63
  %arrayidx7 = getelementptr inbounds i8, i8* %2, i64 %3, !dbg !61
  %4 = load i8, i8* %arrayidx7, align 1, !dbg !61
  %5 = load i64, i64* %i, align 8, !dbg !64
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %5, !dbg !65
  store i8 %4, i8* %arrayidx8, align 1, !dbg !66
  br label %for.inc, !dbg !67

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !68
  %inc = add i64 %6, 1, !dbg !68
  store i64 %inc, i64* %i, align 8, !dbg !68
  br label %for.cond, !dbg !69, !llvm.loop !70

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !73
  store i8 0, i8* %arrayidx9, align 1, !dbg !74
  %arraydecay10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !75
  call void @printLine(i8* %arraydecay10), !dbg !76
  ret void, !dbg !77
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_declare_loop_15_good() #0 !dbg !78 {
entry:
  call void @goodG2B1(), !dbg !79
  call void @goodG2B2(), !dbg !80
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
  call void @CWE126_Buffer_Overread__char_declare_loop_15_good(), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !96
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !97
  call void @CWE126_Buffer_Overread__char_declare_loop_15_bad(), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !99
  ret i32 0, !dbg !100
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !101 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !102, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !104, metadata !DIExpression()), !dbg !105
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !106, metadata !DIExpression()), !dbg !107
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !108
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !108
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !109
  store i8 0, i8* %arrayidx, align 1, !dbg !110
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !111
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !111
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !112
  store i8 0, i8* %arrayidx2, align 1, !dbg !113
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !114
  store i8* %arraydecay3, i8** %data, align 8, !dbg !115
  call void @llvm.dbg.declare(metadata i64* %i, metadata !116, metadata !DIExpression()), !dbg !118
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !119, metadata !DIExpression()), !dbg !120
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !121, metadata !DIExpression()), !dbg !122
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !123
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay4, i8 67, i64 99, i1 false), !dbg !123
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !124
  store i8 0, i8* %arrayidx5, align 1, !dbg !125
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !126
  %call = call i64 @strlen(i8* %arraydecay6) #6, !dbg !127
  store i64 %call, i64* %destLen, align 8, !dbg !128
  store i64 0, i64* %i, align 8, !dbg !129
  br label %for.cond, !dbg !131

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !132
  %1 = load i64, i64* %destLen, align 8, !dbg !134
  %cmp = icmp ult i64 %0, %1, !dbg !135
  br i1 %cmp, label %for.body, label %for.end, !dbg !136

for.body:                                         ; preds = %for.cond
  %2 = load i8*, i8** %data, align 8, !dbg !137
  %3 = load i64, i64* %i, align 8, !dbg !139
  %arrayidx7 = getelementptr inbounds i8, i8* %2, i64 %3, !dbg !137
  %4 = load i8, i8* %arrayidx7, align 1, !dbg !137
  %5 = load i64, i64* %i, align 8, !dbg !140
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %5, !dbg !141
  store i8 %4, i8* %arrayidx8, align 1, !dbg !142
  br label %for.inc, !dbg !143

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !144
  %inc = add i64 %6, 1, !dbg !144
  store i64 %inc, i64* %i, align 8, !dbg !144
  br label %for.cond, !dbg !145, !llvm.loop !146

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !148
  store i8 0, i8* %arrayidx9, align 1, !dbg !149
  %arraydecay10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !150
  call void @printLine(i8* %arraydecay10), !dbg !151
  ret void, !dbg !152
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !153 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !154, metadata !DIExpression()), !dbg !155
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !156, metadata !DIExpression()), !dbg !157
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !158, metadata !DIExpression()), !dbg !159
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !160
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !160
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !161
  store i8 0, i8* %arrayidx, align 1, !dbg !162
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !163
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !163
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !164
  store i8 0, i8* %arrayidx2, align 1, !dbg !165
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !166
  store i8* %arraydecay3, i8** %data, align 8, !dbg !167
  call void @llvm.dbg.declare(metadata i64* %i, metadata !168, metadata !DIExpression()), !dbg !170
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !171, metadata !DIExpression()), !dbg !172
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !173, metadata !DIExpression()), !dbg !174
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !175
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay4, i8 67, i64 99, i1 false), !dbg !175
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !176
  store i8 0, i8* %arrayidx5, align 1, !dbg !177
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !178
  %call = call i64 @strlen(i8* %arraydecay6) #6, !dbg !179
  store i64 %call, i64* %destLen, align 8, !dbg !180
  store i64 0, i64* %i, align 8, !dbg !181
  br label %for.cond, !dbg !183

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !184
  %1 = load i64, i64* %destLen, align 8, !dbg !186
  %cmp = icmp ult i64 %0, %1, !dbg !187
  br i1 %cmp, label %for.body, label %for.end, !dbg !188

for.body:                                         ; preds = %for.cond
  %2 = load i8*, i8** %data, align 8, !dbg !189
  %3 = load i64, i64* %i, align 8, !dbg !191
  %arrayidx7 = getelementptr inbounds i8, i8* %2, i64 %3, !dbg !189
  %4 = load i8, i8* %arrayidx7, align 1, !dbg !189
  %5 = load i64, i64* %i, align 8, !dbg !192
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %5, !dbg !193
  store i8 %4, i8* %arrayidx8, align 1, !dbg !194
  br label %for.inc, !dbg !195

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !196
  %inc = add i64 %6, 1, !dbg !196
  store i64 %inc, i64* %i, align 8, !dbg !196
  br label %for.cond, !dbg !197, !llvm.loop !198

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !200
  store i8 0, i8* %arrayidx9, align 1, !dbg !201
  %arraydecay10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !202
  call void @printLine(i8* %arraydecay10), !dbg !203
  ret void, !dbg !204
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__char_declare_loop_15.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_declare_loop_15_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__char_declare_loop_15.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 25, column: 12, scope: !11)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 26, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 400, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 50)
!23 = !DILocation(line: 26, column: 10, scope: !11)
!24 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 27, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 800, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 27, column: 10, scope: !11)
!29 = !DILocation(line: 28, column: 5, scope: !11)
!30 = !DILocation(line: 29, column: 5, scope: !11)
!31 = !DILocation(line: 29, column: 25, scope: !11)
!32 = !DILocation(line: 30, column: 5, scope: !11)
!33 = !DILocation(line: 31, column: 5, scope: !11)
!34 = !DILocation(line: 31, column: 27, scope: !11)
!35 = !DILocation(line: 36, column: 16, scope: !11)
!36 = !DILocation(line: 36, column: 14, scope: !11)
!37 = !DILocalVariable(name: "i", scope: !38, file: !12, line: 44, type: !39)
!38 = distinct !DILexicalBlock(scope: !11, file: !12, line: 43, column: 5)
!39 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !40, line: 46, baseType: !41)
!40 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!41 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!42 = !DILocation(line: 44, column: 16, scope: !38)
!43 = !DILocalVariable(name: "destLen", scope: !38, file: !12, line: 44, type: !39)
!44 = !DILocation(line: 44, column: 19, scope: !38)
!45 = !DILocalVariable(name: "dest", scope: !38, file: !12, line: 45, type: !25)
!46 = !DILocation(line: 45, column: 14, scope: !38)
!47 = !DILocation(line: 46, column: 9, scope: !38)
!48 = !DILocation(line: 47, column: 9, scope: !38)
!49 = !DILocation(line: 47, column: 21, scope: !38)
!50 = !DILocation(line: 48, column: 26, scope: !38)
!51 = !DILocation(line: 48, column: 19, scope: !38)
!52 = !DILocation(line: 48, column: 17, scope: !38)
!53 = !DILocation(line: 51, column: 16, scope: !54)
!54 = distinct !DILexicalBlock(scope: !38, file: !12, line: 51, column: 9)
!55 = !DILocation(line: 51, column: 14, scope: !54)
!56 = !DILocation(line: 51, column: 21, scope: !57)
!57 = distinct !DILexicalBlock(scope: !54, file: !12, line: 51, column: 9)
!58 = !DILocation(line: 51, column: 25, scope: !57)
!59 = !DILocation(line: 51, column: 23, scope: !57)
!60 = !DILocation(line: 51, column: 9, scope: !54)
!61 = !DILocation(line: 53, column: 23, scope: !62)
!62 = distinct !DILexicalBlock(scope: !57, file: !12, line: 52, column: 9)
!63 = !DILocation(line: 53, column: 28, scope: !62)
!64 = !DILocation(line: 53, column: 18, scope: !62)
!65 = !DILocation(line: 53, column: 13, scope: !62)
!66 = !DILocation(line: 53, column: 21, scope: !62)
!67 = !DILocation(line: 54, column: 9, scope: !62)
!68 = !DILocation(line: 51, column: 35, scope: !57)
!69 = !DILocation(line: 51, column: 9, scope: !57)
!70 = distinct !{!70, !60, !71, !72}
!71 = !DILocation(line: 54, column: 9, scope: !54)
!72 = !{!"llvm.loop.mustprogress"}
!73 = !DILocation(line: 55, column: 9, scope: !38)
!74 = !DILocation(line: 55, column: 21, scope: !38)
!75 = !DILocation(line: 56, column: 19, scope: !38)
!76 = !DILocation(line: 56, column: 9, scope: !38)
!77 = !DILocation(line: 58, column: 1, scope: !11)
!78 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_declare_loop_15_good", scope: !12, file: !12, line: 140, type: !13, scopeLine: 141, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DILocation(line: 142, column: 5, scope: !78)
!80 = !DILocation(line: 143, column: 5, scope: !78)
!81 = !DILocation(line: 144, column: 1, scope: !78)
!82 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 156, type: !83, scopeLine: 157, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DISubroutineType(types: !84)
!84 = !{!85, !85, !86}
!85 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!87 = !DILocalVariable(name: "argc", arg: 1, scope: !82, file: !12, line: 156, type: !85)
!88 = !DILocation(line: 156, column: 14, scope: !82)
!89 = !DILocalVariable(name: "argv", arg: 2, scope: !82, file: !12, line: 156, type: !86)
!90 = !DILocation(line: 156, column: 27, scope: !82)
!91 = !DILocation(line: 159, column: 22, scope: !82)
!92 = !DILocation(line: 159, column: 12, scope: !82)
!93 = !DILocation(line: 159, column: 5, scope: !82)
!94 = !DILocation(line: 161, column: 5, scope: !82)
!95 = !DILocation(line: 162, column: 5, scope: !82)
!96 = !DILocation(line: 163, column: 5, scope: !82)
!97 = !DILocation(line: 166, column: 5, scope: !82)
!98 = !DILocation(line: 167, column: 5, scope: !82)
!99 = !DILocation(line: 168, column: 5, scope: !82)
!100 = !DILocation(line: 170, column: 5, scope: !82)
!101 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 65, type: !13, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!102 = !DILocalVariable(name: "data", scope: !101, file: !12, line: 67, type: !16)
!103 = !DILocation(line: 67, column: 12, scope: !101)
!104 = !DILocalVariable(name: "dataBadBuffer", scope: !101, file: !12, line: 68, type: !20)
!105 = !DILocation(line: 68, column: 10, scope: !101)
!106 = !DILocalVariable(name: "dataGoodBuffer", scope: !101, file: !12, line: 69, type: !25)
!107 = !DILocation(line: 69, column: 10, scope: !101)
!108 = !DILocation(line: 70, column: 5, scope: !101)
!109 = !DILocation(line: 71, column: 5, scope: !101)
!110 = !DILocation(line: 71, column: 25, scope: !101)
!111 = !DILocation(line: 72, column: 5, scope: !101)
!112 = !DILocation(line: 73, column: 5, scope: !101)
!113 = !DILocation(line: 73, column: 27, scope: !101)
!114 = !DILocation(line: 82, column: 16, scope: !101)
!115 = !DILocation(line: 82, column: 14, scope: !101)
!116 = !DILocalVariable(name: "i", scope: !117, file: !12, line: 86, type: !39)
!117 = distinct !DILexicalBlock(scope: !101, file: !12, line: 85, column: 5)
!118 = !DILocation(line: 86, column: 16, scope: !117)
!119 = !DILocalVariable(name: "destLen", scope: !117, file: !12, line: 86, type: !39)
!120 = !DILocation(line: 86, column: 19, scope: !117)
!121 = !DILocalVariable(name: "dest", scope: !117, file: !12, line: 87, type: !25)
!122 = !DILocation(line: 87, column: 14, scope: !117)
!123 = !DILocation(line: 88, column: 9, scope: !117)
!124 = !DILocation(line: 89, column: 9, scope: !117)
!125 = !DILocation(line: 89, column: 21, scope: !117)
!126 = !DILocation(line: 90, column: 26, scope: !117)
!127 = !DILocation(line: 90, column: 19, scope: !117)
!128 = !DILocation(line: 90, column: 17, scope: !117)
!129 = !DILocation(line: 93, column: 16, scope: !130)
!130 = distinct !DILexicalBlock(scope: !117, file: !12, line: 93, column: 9)
!131 = !DILocation(line: 93, column: 14, scope: !130)
!132 = !DILocation(line: 93, column: 21, scope: !133)
!133 = distinct !DILexicalBlock(scope: !130, file: !12, line: 93, column: 9)
!134 = !DILocation(line: 93, column: 25, scope: !133)
!135 = !DILocation(line: 93, column: 23, scope: !133)
!136 = !DILocation(line: 93, column: 9, scope: !130)
!137 = !DILocation(line: 95, column: 23, scope: !138)
!138 = distinct !DILexicalBlock(scope: !133, file: !12, line: 94, column: 9)
!139 = !DILocation(line: 95, column: 28, scope: !138)
!140 = !DILocation(line: 95, column: 18, scope: !138)
!141 = !DILocation(line: 95, column: 13, scope: !138)
!142 = !DILocation(line: 95, column: 21, scope: !138)
!143 = !DILocation(line: 96, column: 9, scope: !138)
!144 = !DILocation(line: 93, column: 35, scope: !133)
!145 = !DILocation(line: 93, column: 9, scope: !133)
!146 = distinct !{!146, !136, !147, !72}
!147 = !DILocation(line: 96, column: 9, scope: !130)
!148 = !DILocation(line: 97, column: 9, scope: !117)
!149 = !DILocation(line: 97, column: 21, scope: !117)
!150 = !DILocation(line: 98, column: 19, scope: !117)
!151 = !DILocation(line: 98, column: 9, scope: !117)
!152 = !DILocation(line: 100, column: 1, scope: !101)
!153 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 103, type: !13, scopeLine: 104, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!154 = !DILocalVariable(name: "data", scope: !153, file: !12, line: 105, type: !16)
!155 = !DILocation(line: 105, column: 12, scope: !153)
!156 = !DILocalVariable(name: "dataBadBuffer", scope: !153, file: !12, line: 106, type: !20)
!157 = !DILocation(line: 106, column: 10, scope: !153)
!158 = !DILocalVariable(name: "dataGoodBuffer", scope: !153, file: !12, line: 107, type: !25)
!159 = !DILocation(line: 107, column: 10, scope: !153)
!160 = !DILocation(line: 108, column: 5, scope: !153)
!161 = !DILocation(line: 109, column: 5, scope: !153)
!162 = !DILocation(line: 109, column: 25, scope: !153)
!163 = !DILocation(line: 110, column: 5, scope: !153)
!164 = !DILocation(line: 111, column: 5, scope: !153)
!165 = !DILocation(line: 111, column: 27, scope: !153)
!166 = !DILocation(line: 116, column: 16, scope: !153)
!167 = !DILocation(line: 116, column: 14, scope: !153)
!168 = !DILocalVariable(name: "i", scope: !169, file: !12, line: 124, type: !39)
!169 = distinct !DILexicalBlock(scope: !153, file: !12, line: 123, column: 5)
!170 = !DILocation(line: 124, column: 16, scope: !169)
!171 = !DILocalVariable(name: "destLen", scope: !169, file: !12, line: 124, type: !39)
!172 = !DILocation(line: 124, column: 19, scope: !169)
!173 = !DILocalVariable(name: "dest", scope: !169, file: !12, line: 125, type: !25)
!174 = !DILocation(line: 125, column: 14, scope: !169)
!175 = !DILocation(line: 126, column: 9, scope: !169)
!176 = !DILocation(line: 127, column: 9, scope: !169)
!177 = !DILocation(line: 127, column: 21, scope: !169)
!178 = !DILocation(line: 128, column: 26, scope: !169)
!179 = !DILocation(line: 128, column: 19, scope: !169)
!180 = !DILocation(line: 128, column: 17, scope: !169)
!181 = !DILocation(line: 131, column: 16, scope: !182)
!182 = distinct !DILexicalBlock(scope: !169, file: !12, line: 131, column: 9)
!183 = !DILocation(line: 131, column: 14, scope: !182)
!184 = !DILocation(line: 131, column: 21, scope: !185)
!185 = distinct !DILexicalBlock(scope: !182, file: !12, line: 131, column: 9)
!186 = !DILocation(line: 131, column: 25, scope: !185)
!187 = !DILocation(line: 131, column: 23, scope: !185)
!188 = !DILocation(line: 131, column: 9, scope: !182)
!189 = !DILocation(line: 133, column: 23, scope: !190)
!190 = distinct !DILexicalBlock(scope: !185, file: !12, line: 132, column: 9)
!191 = !DILocation(line: 133, column: 28, scope: !190)
!192 = !DILocation(line: 133, column: 18, scope: !190)
!193 = !DILocation(line: 133, column: 13, scope: !190)
!194 = !DILocation(line: 133, column: 21, scope: !190)
!195 = !DILocation(line: 134, column: 9, scope: !190)
!196 = !DILocation(line: 131, column: 35, scope: !185)
!197 = !DILocation(line: 131, column: 9, scope: !185)
!198 = distinct !{!198, !188, !199, !72}
!199 = !DILocation(line: 134, column: 9, scope: !182)
!200 = !DILocation(line: 135, column: 9, scope: !169)
!201 = !DILocation(line: 135, column: 21, scope: !169)
!202 = !DILocation(line: 136, column: 19, scope: !169)
!203 = !DILocation(line: 136, column: 9, scope: !169)
!204 = !DILocation(line: 138, column: 1, scope: !153)

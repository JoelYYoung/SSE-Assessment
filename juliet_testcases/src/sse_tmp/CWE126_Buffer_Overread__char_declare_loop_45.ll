; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__char_declare_loop_45.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__char_declare_loop_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE126_Buffer_Overread__char_declare_loop_45_badData = internal global i8* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE126_Buffer_Overread__char_declare_loop_45_goodG2BData = internal global i8* null, align 8, !dbg !8

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_declare_loop_45_bad() #0 !dbg !19 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !22, metadata !DIExpression()), !dbg !23
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
  %arraydecay3 = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !40
  store i8* %arraydecay3, i8** %data, align 8, !dbg !41
  %0 = load i8*, i8** %data, align 8, !dbg !42
  store i8* %0, i8** @CWE126_Buffer_Overread__char_declare_loop_45_badData, align 8, !dbg !43
  call void @badSink(), !dbg !44
  ret void, !dbg !45
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_declare_loop_45_good() #0 !dbg !46 {
entry:
  call void @goodG2B(), !dbg !47
  ret void, !dbg !48
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !49 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !54, metadata !DIExpression()), !dbg !55
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !56, metadata !DIExpression()), !dbg !57
  %call = call i64 @time(i64* null) #6, !dbg !58
  %conv = trunc i64 %call to i32, !dbg !59
  call void @srand(i32 %conv) #6, !dbg !60
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !61
  call void @CWE126_Buffer_Overread__char_declare_loop_45_good(), !dbg !62
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !64
  call void @CWE126_Buffer_Overread__char_declare_loop_45_bad(), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !66
  ret i32 0, !dbg !67
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @badSink() #0 !dbg !68 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !69, metadata !DIExpression()), !dbg !70
  %0 = load i8*, i8** @CWE126_Buffer_Overread__char_declare_loop_45_badData, align 8, !dbg !71
  store i8* %0, i8** %data, align 8, !dbg !70
  call void @llvm.dbg.declare(metadata i64* %i, metadata !72, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !78, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !80, metadata !DIExpression()), !dbg !81
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !82
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !82
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !83
  store i8 0, i8* %arrayidx, align 1, !dbg !84
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !85
  %call = call i64 @strlen(i8* %arraydecay1) #7, !dbg !86
  store i64 %call, i64* %destLen, align 8, !dbg !87
  store i64 0, i64* %i, align 8, !dbg !88
  br label %for.cond, !dbg !90

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !91
  %2 = load i64, i64* %destLen, align 8, !dbg !93
  %cmp = icmp ult i64 %1, %2, !dbg !94
  br i1 %cmp, label %for.body, label %for.end, !dbg !95

for.body:                                         ; preds = %for.cond
  %3 = load i8*, i8** %data, align 8, !dbg !96
  %4 = load i64, i64* %i, align 8, !dbg !98
  %arrayidx2 = getelementptr inbounds i8, i8* %3, i64 %4, !dbg !96
  %5 = load i8, i8* %arrayidx2, align 1, !dbg !96
  %6 = load i64, i64* %i, align 8, !dbg !99
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %6, !dbg !100
  store i8 %5, i8* %arrayidx3, align 1, !dbg !101
  br label %for.inc, !dbg !102

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !103
  %inc = add i64 %7, 1, !dbg !103
  store i64 %inc, i64* %i, align 8, !dbg !103
  br label %for.cond, !dbg !104, !llvm.loop !105

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !108
  store i8 0, i8* %arrayidx4, align 1, !dbg !109
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !110
  call void @printLine(i8* %arraydecay5), !dbg !111
  ret void, !dbg !112
}

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !113 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !114, metadata !DIExpression()), !dbg !115
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !116, metadata !DIExpression()), !dbg !117
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !118, metadata !DIExpression()), !dbg !119
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !120
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !120
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !121
  store i8 0, i8* %arrayidx, align 1, !dbg !122
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !123
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !123
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !124
  store i8 0, i8* %arrayidx2, align 1, !dbg !125
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !126
  store i8* %arraydecay3, i8** %data, align 8, !dbg !127
  %0 = load i8*, i8** %data, align 8, !dbg !128
  store i8* %0, i8** @CWE126_Buffer_Overread__char_declare_loop_45_goodG2BData, align 8, !dbg !129
  call void @goodG2BSink(), !dbg !130
  ret void, !dbg !131
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !132 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !133, metadata !DIExpression()), !dbg !134
  %0 = load i8*, i8** @CWE126_Buffer_Overread__char_declare_loop_45_goodG2BData, align 8, !dbg !135
  store i8* %0, i8** %data, align 8, !dbg !134
  call void @llvm.dbg.declare(metadata i64* %i, metadata !136, metadata !DIExpression()), !dbg !138
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !139, metadata !DIExpression()), !dbg !140
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !141, metadata !DIExpression()), !dbg !142
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !143
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !143
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !144
  store i8 0, i8* %arrayidx, align 1, !dbg !145
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !146
  %call = call i64 @strlen(i8* %arraydecay1) #7, !dbg !147
  store i64 %call, i64* %destLen, align 8, !dbg !148
  store i64 0, i64* %i, align 8, !dbg !149
  br label %for.cond, !dbg !151

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !152
  %2 = load i64, i64* %destLen, align 8, !dbg !154
  %cmp = icmp ult i64 %1, %2, !dbg !155
  br i1 %cmp, label %for.body, label %for.end, !dbg !156

for.body:                                         ; preds = %for.cond
  %3 = load i8*, i8** %data, align 8, !dbg !157
  %4 = load i64, i64* %i, align 8, !dbg !159
  %arrayidx2 = getelementptr inbounds i8, i8* %3, i64 %4, !dbg !157
  %5 = load i8, i8* %arrayidx2, align 1, !dbg !157
  %6 = load i64, i64* %i, align 8, !dbg !160
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %6, !dbg !161
  store i8 %5, i8* %arrayidx3, align 1, !dbg !162
  br label %for.inc, !dbg !163

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !164
  %inc = add i64 %7, 1, !dbg !164
  store i64 %inc, i64* %i, align 8, !dbg !164
  br label %for.cond, !dbg !165, !llvm.loop !166

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !168
  store i8 0, i8* %arrayidx4, align 1, !dbg !169
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !170
  call void @printLine(i8* %arraydecay5), !dbg !171
  ret void, !dbg !172
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE126_Buffer_Overread__char_declare_loop_45_badData", scope: !2, file: !10, line: 21, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__char_declare_loop_45.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "CWE126_Buffer_Overread__char_declare_loop_45_goodG2BData", scope: !2, file: !10, line: 22, type: !11, isLocal: true, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__char_declare_loop_45.c", directory: "/root/SSE-Assessment")
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"clang version 13.0.0"}
!19 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_declare_loop_45_bad", scope: !10, file: !10, line: 46, type: !20, scopeLine: 47, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !19, file: !10, line: 48, type: !11)
!23 = !DILocation(line: 48, column: 12, scope: !19)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !19, file: !10, line: 49, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 400, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 50)
!28 = !DILocation(line: 49, column: 10, scope: !19)
!29 = !DILocalVariable(name: "dataGoodBuffer", scope: !19, file: !10, line: 50, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 800, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 100)
!33 = !DILocation(line: 50, column: 10, scope: !19)
!34 = !DILocation(line: 51, column: 5, scope: !19)
!35 = !DILocation(line: 52, column: 5, scope: !19)
!36 = !DILocation(line: 52, column: 25, scope: !19)
!37 = !DILocation(line: 53, column: 5, scope: !19)
!38 = !DILocation(line: 54, column: 5, scope: !19)
!39 = !DILocation(line: 54, column: 27, scope: !19)
!40 = !DILocation(line: 56, column: 12, scope: !19)
!41 = !DILocation(line: 56, column: 10, scope: !19)
!42 = !DILocation(line: 57, column: 60, scope: !19)
!43 = !DILocation(line: 57, column: 58, scope: !19)
!44 = !DILocation(line: 58, column: 5, scope: !19)
!45 = !DILocation(line: 59, column: 1, scope: !19)
!46 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_declare_loop_45_good", scope: !10, file: !10, line: 101, type: !20, scopeLine: 102, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!47 = !DILocation(line: 103, column: 5, scope: !46)
!48 = !DILocation(line: 104, column: 1, scope: !46)
!49 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 115, type: !50, scopeLine: 116, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!50 = !DISubroutineType(types: !51)
!51 = !{!52, !52, !53}
!52 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!54 = !DILocalVariable(name: "argc", arg: 1, scope: !49, file: !10, line: 115, type: !52)
!55 = !DILocation(line: 115, column: 14, scope: !49)
!56 = !DILocalVariable(name: "argv", arg: 2, scope: !49, file: !10, line: 115, type: !53)
!57 = !DILocation(line: 115, column: 27, scope: !49)
!58 = !DILocation(line: 118, column: 22, scope: !49)
!59 = !DILocation(line: 118, column: 12, scope: !49)
!60 = !DILocation(line: 118, column: 5, scope: !49)
!61 = !DILocation(line: 120, column: 5, scope: !49)
!62 = !DILocation(line: 121, column: 5, scope: !49)
!63 = !DILocation(line: 122, column: 5, scope: !49)
!64 = !DILocation(line: 125, column: 5, scope: !49)
!65 = !DILocation(line: 126, column: 5, scope: !49)
!66 = !DILocation(line: 127, column: 5, scope: !49)
!67 = !DILocation(line: 129, column: 5, scope: !49)
!68 = distinct !DISubprogram(name: "badSink", scope: !10, file: !10, line: 26, type: !20, scopeLine: 27, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!69 = !DILocalVariable(name: "data", scope: !68, file: !10, line: 28, type: !11)
!70 = !DILocation(line: 28, column: 12, scope: !68)
!71 = !DILocation(line: 28, column: 19, scope: !68)
!72 = !DILocalVariable(name: "i", scope: !73, file: !10, line: 30, type: !74)
!73 = distinct !DILexicalBlock(scope: !68, file: !10, line: 29, column: 5)
!74 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !75, line: 46, baseType: !76)
!75 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!76 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!77 = !DILocation(line: 30, column: 16, scope: !73)
!78 = !DILocalVariable(name: "destLen", scope: !73, file: !10, line: 30, type: !74)
!79 = !DILocation(line: 30, column: 19, scope: !73)
!80 = !DILocalVariable(name: "dest", scope: !73, file: !10, line: 31, type: !30)
!81 = !DILocation(line: 31, column: 14, scope: !73)
!82 = !DILocation(line: 32, column: 9, scope: !73)
!83 = !DILocation(line: 33, column: 9, scope: !73)
!84 = !DILocation(line: 33, column: 21, scope: !73)
!85 = !DILocation(line: 34, column: 26, scope: !73)
!86 = !DILocation(line: 34, column: 19, scope: !73)
!87 = !DILocation(line: 34, column: 17, scope: !73)
!88 = !DILocation(line: 37, column: 16, scope: !89)
!89 = distinct !DILexicalBlock(scope: !73, file: !10, line: 37, column: 9)
!90 = !DILocation(line: 37, column: 14, scope: !89)
!91 = !DILocation(line: 37, column: 21, scope: !92)
!92 = distinct !DILexicalBlock(scope: !89, file: !10, line: 37, column: 9)
!93 = !DILocation(line: 37, column: 25, scope: !92)
!94 = !DILocation(line: 37, column: 23, scope: !92)
!95 = !DILocation(line: 37, column: 9, scope: !89)
!96 = !DILocation(line: 39, column: 23, scope: !97)
!97 = distinct !DILexicalBlock(scope: !92, file: !10, line: 38, column: 9)
!98 = !DILocation(line: 39, column: 28, scope: !97)
!99 = !DILocation(line: 39, column: 18, scope: !97)
!100 = !DILocation(line: 39, column: 13, scope: !97)
!101 = !DILocation(line: 39, column: 21, scope: !97)
!102 = !DILocation(line: 40, column: 9, scope: !97)
!103 = !DILocation(line: 37, column: 35, scope: !92)
!104 = !DILocation(line: 37, column: 9, scope: !92)
!105 = distinct !{!105, !95, !106, !107}
!106 = !DILocation(line: 40, column: 9, scope: !89)
!107 = !{!"llvm.loop.mustprogress"}
!108 = !DILocation(line: 41, column: 9, scope: !73)
!109 = !DILocation(line: 41, column: 21, scope: !73)
!110 = !DILocation(line: 42, column: 19, scope: !73)
!111 = !DILocation(line: 42, column: 9, scope: !73)
!112 = !DILocation(line: 44, column: 1, scope: !68)
!113 = distinct !DISubprogram(name: "goodG2B", scope: !10, file: !10, line: 86, type: !20, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!114 = !DILocalVariable(name: "data", scope: !113, file: !10, line: 88, type: !11)
!115 = !DILocation(line: 88, column: 12, scope: !113)
!116 = !DILocalVariable(name: "dataBadBuffer", scope: !113, file: !10, line: 89, type: !25)
!117 = !DILocation(line: 89, column: 10, scope: !113)
!118 = !DILocalVariable(name: "dataGoodBuffer", scope: !113, file: !10, line: 90, type: !30)
!119 = !DILocation(line: 90, column: 10, scope: !113)
!120 = !DILocation(line: 91, column: 5, scope: !113)
!121 = !DILocation(line: 92, column: 5, scope: !113)
!122 = !DILocation(line: 92, column: 25, scope: !113)
!123 = !DILocation(line: 93, column: 5, scope: !113)
!124 = !DILocation(line: 94, column: 5, scope: !113)
!125 = !DILocation(line: 94, column: 27, scope: !113)
!126 = !DILocation(line: 96, column: 12, scope: !113)
!127 = !DILocation(line: 96, column: 10, scope: !113)
!128 = !DILocation(line: 97, column: 64, scope: !113)
!129 = !DILocation(line: 97, column: 62, scope: !113)
!130 = !DILocation(line: 98, column: 5, scope: !113)
!131 = !DILocation(line: 99, column: 1, scope: !113)
!132 = distinct !DISubprogram(name: "goodG2BSink", scope: !10, file: !10, line: 66, type: !20, scopeLine: 67, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!133 = !DILocalVariable(name: "data", scope: !132, file: !10, line: 68, type: !11)
!134 = !DILocation(line: 68, column: 12, scope: !132)
!135 = !DILocation(line: 68, column: 19, scope: !132)
!136 = !DILocalVariable(name: "i", scope: !137, file: !10, line: 70, type: !74)
!137 = distinct !DILexicalBlock(scope: !132, file: !10, line: 69, column: 5)
!138 = !DILocation(line: 70, column: 16, scope: !137)
!139 = !DILocalVariable(name: "destLen", scope: !137, file: !10, line: 70, type: !74)
!140 = !DILocation(line: 70, column: 19, scope: !137)
!141 = !DILocalVariable(name: "dest", scope: !137, file: !10, line: 71, type: !30)
!142 = !DILocation(line: 71, column: 14, scope: !137)
!143 = !DILocation(line: 72, column: 9, scope: !137)
!144 = !DILocation(line: 73, column: 9, scope: !137)
!145 = !DILocation(line: 73, column: 21, scope: !137)
!146 = !DILocation(line: 74, column: 26, scope: !137)
!147 = !DILocation(line: 74, column: 19, scope: !137)
!148 = !DILocation(line: 74, column: 17, scope: !137)
!149 = !DILocation(line: 77, column: 16, scope: !150)
!150 = distinct !DILexicalBlock(scope: !137, file: !10, line: 77, column: 9)
!151 = !DILocation(line: 77, column: 14, scope: !150)
!152 = !DILocation(line: 77, column: 21, scope: !153)
!153 = distinct !DILexicalBlock(scope: !150, file: !10, line: 77, column: 9)
!154 = !DILocation(line: 77, column: 25, scope: !153)
!155 = !DILocation(line: 77, column: 23, scope: !153)
!156 = !DILocation(line: 77, column: 9, scope: !150)
!157 = !DILocation(line: 79, column: 23, scope: !158)
!158 = distinct !DILexicalBlock(scope: !153, file: !10, line: 78, column: 9)
!159 = !DILocation(line: 79, column: 28, scope: !158)
!160 = !DILocation(line: 79, column: 18, scope: !158)
!161 = !DILocation(line: 79, column: 13, scope: !158)
!162 = !DILocation(line: 79, column: 21, scope: !158)
!163 = !DILocation(line: 80, column: 9, scope: !158)
!164 = !DILocation(line: 77, column: 35, scope: !153)
!165 = !DILocation(line: 77, column: 9, scope: !153)
!166 = distinct !{!166, !156, !167, !107}
!167 = !DILocation(line: 80, column: 9, scope: !150)
!168 = !DILocation(line: 81, column: 9, scope: !137)
!169 = !DILocation(line: 81, column: 21, scope: !137)
!170 = !DILocation(line: 82, column: 19, scope: !137)
!171 = !DILocation(line: 82, column: 9, scope: !137)
!172 = !DILocation(line: 84, column: 1, scope: !132)

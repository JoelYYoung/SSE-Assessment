; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_loop_45.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_loop_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE126_Buffer_Overread__wchar_t_alloca_loop_45_badData = internal global i32* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE126_Buffer_Overread__wchar_t_alloca_loop_45_goodG2BData = internal global i32* null, align 8, !dbg !12

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_alloca_loop_45_bad() #0 !dbg !21 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !26, metadata !DIExpression()), !dbg !27
  %0 = alloca i8, i64 200, align 16, !dbg !28
  %1 = bitcast i8* %0 to i32*, !dbg !29
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !30, metadata !DIExpression()), !dbg !31
  %2 = alloca i8, i64 400, align 16, !dbg !32
  %3 = bitcast i8* %2 to i32*, !dbg !33
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !31
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !34
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #5, !dbg !35
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !36
  store i32 0, i32* %arrayidx, align 4, !dbg !37
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !38
  %call1 = call i32* @wmemset(i32* %6, i32 65, i64 99) #5, !dbg !39
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !40
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !40
  store i32 0, i32* %arrayidx2, align 4, !dbg !41
  %8 = load i32*, i32** %dataBadBuffer, align 8, !dbg !42
  store i32* %8, i32** %data, align 8, !dbg !43
  %9 = load i32*, i32** %data, align 8, !dbg !44
  store i32* %9, i32** @CWE126_Buffer_Overread__wchar_t_alloca_loop_45_badData, align 8, !dbg !45
  call void @badSink(), !dbg !46
  ret void, !dbg !47
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_alloca_loop_45_good() #0 !dbg !48 {
entry:
  call void @goodG2B(), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !51 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !57, metadata !DIExpression()), !dbg !58
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !59, metadata !DIExpression()), !dbg !60
  %call = call i64 @time(i64* null) #5, !dbg !61
  %conv = trunc i64 %call to i32, !dbg !62
  call void @srand(i32 %conv) #5, !dbg !63
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !64
  call void @CWE126_Buffer_Overread__wchar_t_alloca_loop_45_good(), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !67
  call void @CWE126_Buffer_Overread__wchar_t_alloca_loop_45_bad(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !69
  ret i32 0, !dbg !70
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @badSink() #0 !dbg !71 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !72, metadata !DIExpression()), !dbg !73
  %0 = load i32*, i32** @CWE126_Buffer_Overread__wchar_t_alloca_loop_45_badData, align 8, !dbg !74
  store i32* %0, i32** %data, align 8, !dbg !73
  call void @llvm.dbg.declare(metadata i64* %i, metadata !75, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !80, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !82, metadata !DIExpression()), !dbg !86
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !87
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !88
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !89
  store i32 0, i32* %arrayidx, align 4, !dbg !90
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !91
  %call2 = call i64 @wcslen(i32* %arraydecay1) #6, !dbg !92
  store i64 %call2, i64* %destLen, align 8, !dbg !93
  store i64 0, i64* %i, align 8, !dbg !94
  br label %for.cond, !dbg !96

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !97
  %2 = load i64, i64* %destLen, align 8, !dbg !99
  %cmp = icmp ult i64 %1, %2, !dbg !100
  br i1 %cmp, label %for.body, label %for.end, !dbg !101

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %data, align 8, !dbg !102
  %4 = load i64, i64* %i, align 8, !dbg !104
  %arrayidx3 = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !102
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !102
  %6 = load i64, i64* %i, align 8, !dbg !105
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %6, !dbg !106
  store i32 %5, i32* %arrayidx4, align 4, !dbg !107
  br label %for.inc, !dbg !108

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !109
  %inc = add i64 %7, 1, !dbg !109
  store i64 %inc, i64* %i, align 8, !dbg !109
  br label %for.cond, !dbg !110, !llvm.loop !111

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !114
  store i32 0, i32* %arrayidx5, align 4, !dbg !115
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !116
  call void @printWLine(i32* %arraydecay6), !dbg !117
  ret void, !dbg !118
}

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !119 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !120, metadata !DIExpression()), !dbg !121
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !122, metadata !DIExpression()), !dbg !123
  %0 = alloca i8, i64 200, align 16, !dbg !124
  %1 = bitcast i8* %0 to i32*, !dbg !125
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !123
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !126, metadata !DIExpression()), !dbg !127
  %2 = alloca i8, i64 400, align 16, !dbg !128
  %3 = bitcast i8* %2 to i32*, !dbg !129
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !127
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !130
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #5, !dbg !131
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !132
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !132
  store i32 0, i32* %arrayidx, align 4, !dbg !133
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !134
  %call1 = call i32* @wmemset(i32* %6, i32 65, i64 99) #5, !dbg !135
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !136
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !136
  store i32 0, i32* %arrayidx2, align 4, !dbg !137
  %8 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !138
  store i32* %8, i32** %data, align 8, !dbg !139
  %9 = load i32*, i32** %data, align 8, !dbg !140
  store i32* %9, i32** @CWE126_Buffer_Overread__wchar_t_alloca_loop_45_goodG2BData, align 8, !dbg !141
  call void @goodG2BSink(), !dbg !142
  ret void, !dbg !143
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !144 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !145, metadata !DIExpression()), !dbg !146
  %0 = load i32*, i32** @CWE126_Buffer_Overread__wchar_t_alloca_loop_45_goodG2BData, align 8, !dbg !147
  store i32* %0, i32** %data, align 8, !dbg !146
  call void @llvm.dbg.declare(metadata i64* %i, metadata !148, metadata !DIExpression()), !dbg !150
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !151, metadata !DIExpression()), !dbg !152
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !153, metadata !DIExpression()), !dbg !154
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !155
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !156
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !157
  store i32 0, i32* %arrayidx, align 4, !dbg !158
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !159
  %call2 = call i64 @wcslen(i32* %arraydecay1) #6, !dbg !160
  store i64 %call2, i64* %destLen, align 8, !dbg !161
  store i64 0, i64* %i, align 8, !dbg !162
  br label %for.cond, !dbg !164

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !165
  %2 = load i64, i64* %destLen, align 8, !dbg !167
  %cmp = icmp ult i64 %1, %2, !dbg !168
  br i1 %cmp, label %for.body, label %for.end, !dbg !169

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %data, align 8, !dbg !170
  %4 = load i64, i64* %i, align 8, !dbg !172
  %arrayidx3 = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !170
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !170
  %6 = load i64, i64* %i, align 8, !dbg !173
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %6, !dbg !174
  store i32 %5, i32* %arrayidx4, align 4, !dbg !175
  br label %for.inc, !dbg !176

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !177
  %inc = add i64 %7, 1, !dbg !177
  store i64 %inc, i64* %i, align 8, !dbg !177
  br label %for.cond, !dbg !178, !llvm.loop !179

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !181
  store i32 0, i32* %arrayidx5, align 4, !dbg !182
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !183
  call void @printWLine(i32* %arraydecay6), !dbg !184
  ret void, !dbg !185
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!15, !16, !17, !18, !19}
!llvm.ident = !{!20}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE126_Buffer_Overread__wchar_t_alloca_loop_45_badData", scope: !2, file: !14, line: 21, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !11, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_loop_45.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !10}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !{!0, !12}
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "CWE126_Buffer_Overread__wchar_t_alloca_loop_45_goodG2BData", scope: !2, file: !14, line: 22, type: !6, isLocal: true, isDefinition: true)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_loop_45.c", directory: "/root/SSE-Assessment")
!15 = !{i32 7, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{i32 1, !"wchar_size", i32 4}
!18 = !{i32 7, !"uwtable", i32 1}
!19 = !{i32 7, !"frame-pointer", i32 2}
!20 = !{!"clang version 13.0.0"}
!21 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_loop_45_bad", scope: !14, file: !14, line: 46, type: !22, scopeLine: 47, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !21, file: !14, line: 48, type: !6)
!25 = !DILocation(line: 48, column: 15, scope: !21)
!26 = !DILocalVariable(name: "dataBadBuffer", scope: !21, file: !14, line: 49, type: !6)
!27 = !DILocation(line: 49, column: 15, scope: !21)
!28 = !DILocation(line: 49, column: 42, scope: !21)
!29 = !DILocation(line: 49, column: 31, scope: !21)
!30 = !DILocalVariable(name: "dataGoodBuffer", scope: !21, file: !14, line: 50, type: !6)
!31 = !DILocation(line: 50, column: 15, scope: !21)
!32 = !DILocation(line: 50, column: 43, scope: !21)
!33 = !DILocation(line: 50, column: 32, scope: !21)
!34 = !DILocation(line: 51, column: 13, scope: !21)
!35 = !DILocation(line: 51, column: 5, scope: !21)
!36 = !DILocation(line: 52, column: 5, scope: !21)
!37 = !DILocation(line: 52, column: 25, scope: !21)
!38 = !DILocation(line: 53, column: 13, scope: !21)
!39 = !DILocation(line: 53, column: 5, scope: !21)
!40 = !DILocation(line: 54, column: 5, scope: !21)
!41 = !DILocation(line: 54, column: 27, scope: !21)
!42 = !DILocation(line: 56, column: 12, scope: !21)
!43 = !DILocation(line: 56, column: 10, scope: !21)
!44 = !DILocation(line: 57, column: 62, scope: !21)
!45 = !DILocation(line: 57, column: 60, scope: !21)
!46 = !DILocation(line: 58, column: 5, scope: !21)
!47 = !DILocation(line: 59, column: 1, scope: !21)
!48 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_loop_45_good", scope: !14, file: !14, line: 101, type: !22, scopeLine: 102, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!49 = !DILocation(line: 103, column: 5, scope: !48)
!50 = !DILocation(line: 104, column: 1, scope: !48)
!51 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 115, type: !52, scopeLine: 116, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!52 = !DISubroutineType(types: !53)
!53 = !{!9, !9, !54}
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !55, size: 64)
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!56 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!57 = !DILocalVariable(name: "argc", arg: 1, scope: !51, file: !14, line: 115, type: !9)
!58 = !DILocation(line: 115, column: 14, scope: !51)
!59 = !DILocalVariable(name: "argv", arg: 2, scope: !51, file: !14, line: 115, type: !54)
!60 = !DILocation(line: 115, column: 27, scope: !51)
!61 = !DILocation(line: 118, column: 22, scope: !51)
!62 = !DILocation(line: 118, column: 12, scope: !51)
!63 = !DILocation(line: 118, column: 5, scope: !51)
!64 = !DILocation(line: 120, column: 5, scope: !51)
!65 = !DILocation(line: 121, column: 5, scope: !51)
!66 = !DILocation(line: 122, column: 5, scope: !51)
!67 = !DILocation(line: 125, column: 5, scope: !51)
!68 = !DILocation(line: 126, column: 5, scope: !51)
!69 = !DILocation(line: 127, column: 5, scope: !51)
!70 = !DILocation(line: 129, column: 5, scope: !51)
!71 = distinct !DISubprogram(name: "badSink", scope: !14, file: !14, line: 26, type: !22, scopeLine: 27, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!72 = !DILocalVariable(name: "data", scope: !71, file: !14, line: 28, type: !6)
!73 = !DILocation(line: 28, column: 15, scope: !71)
!74 = !DILocation(line: 28, column: 22, scope: !71)
!75 = !DILocalVariable(name: "i", scope: !76, file: !14, line: 30, type: !77)
!76 = distinct !DILexicalBlock(scope: !71, file: !14, line: 29, column: 5)
!77 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !8, line: 46, baseType: !78)
!78 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!79 = !DILocation(line: 30, column: 16, scope: !76)
!80 = !DILocalVariable(name: "destLen", scope: !76, file: !14, line: 30, type: !77)
!81 = !DILocation(line: 30, column: 19, scope: !76)
!82 = !DILocalVariable(name: "dest", scope: !76, file: !14, line: 31, type: !83)
!83 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 3200, elements: !84)
!84 = !{!85}
!85 = !DISubrange(count: 100)
!86 = !DILocation(line: 31, column: 17, scope: !76)
!87 = !DILocation(line: 32, column: 17, scope: !76)
!88 = !DILocation(line: 32, column: 9, scope: !76)
!89 = !DILocation(line: 33, column: 9, scope: !76)
!90 = !DILocation(line: 33, column: 21, scope: !76)
!91 = !DILocation(line: 34, column: 26, scope: !76)
!92 = !DILocation(line: 34, column: 19, scope: !76)
!93 = !DILocation(line: 34, column: 17, scope: !76)
!94 = !DILocation(line: 37, column: 16, scope: !95)
!95 = distinct !DILexicalBlock(scope: !76, file: !14, line: 37, column: 9)
!96 = !DILocation(line: 37, column: 14, scope: !95)
!97 = !DILocation(line: 37, column: 21, scope: !98)
!98 = distinct !DILexicalBlock(scope: !95, file: !14, line: 37, column: 9)
!99 = !DILocation(line: 37, column: 25, scope: !98)
!100 = !DILocation(line: 37, column: 23, scope: !98)
!101 = !DILocation(line: 37, column: 9, scope: !95)
!102 = !DILocation(line: 39, column: 23, scope: !103)
!103 = distinct !DILexicalBlock(scope: !98, file: !14, line: 38, column: 9)
!104 = !DILocation(line: 39, column: 28, scope: !103)
!105 = !DILocation(line: 39, column: 18, scope: !103)
!106 = !DILocation(line: 39, column: 13, scope: !103)
!107 = !DILocation(line: 39, column: 21, scope: !103)
!108 = !DILocation(line: 40, column: 9, scope: !103)
!109 = !DILocation(line: 37, column: 35, scope: !98)
!110 = !DILocation(line: 37, column: 9, scope: !98)
!111 = distinct !{!111, !101, !112, !113}
!112 = !DILocation(line: 40, column: 9, scope: !95)
!113 = !{!"llvm.loop.mustprogress"}
!114 = !DILocation(line: 41, column: 9, scope: !76)
!115 = !DILocation(line: 41, column: 21, scope: !76)
!116 = !DILocation(line: 42, column: 20, scope: !76)
!117 = !DILocation(line: 42, column: 9, scope: !76)
!118 = !DILocation(line: 44, column: 1, scope: !71)
!119 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 86, type: !22, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!120 = !DILocalVariable(name: "data", scope: !119, file: !14, line: 88, type: !6)
!121 = !DILocation(line: 88, column: 15, scope: !119)
!122 = !DILocalVariable(name: "dataBadBuffer", scope: !119, file: !14, line: 89, type: !6)
!123 = !DILocation(line: 89, column: 15, scope: !119)
!124 = !DILocation(line: 89, column: 42, scope: !119)
!125 = !DILocation(line: 89, column: 31, scope: !119)
!126 = !DILocalVariable(name: "dataGoodBuffer", scope: !119, file: !14, line: 90, type: !6)
!127 = !DILocation(line: 90, column: 15, scope: !119)
!128 = !DILocation(line: 90, column: 43, scope: !119)
!129 = !DILocation(line: 90, column: 32, scope: !119)
!130 = !DILocation(line: 91, column: 13, scope: !119)
!131 = !DILocation(line: 91, column: 5, scope: !119)
!132 = !DILocation(line: 92, column: 5, scope: !119)
!133 = !DILocation(line: 92, column: 25, scope: !119)
!134 = !DILocation(line: 93, column: 13, scope: !119)
!135 = !DILocation(line: 93, column: 5, scope: !119)
!136 = !DILocation(line: 94, column: 5, scope: !119)
!137 = !DILocation(line: 94, column: 27, scope: !119)
!138 = !DILocation(line: 96, column: 12, scope: !119)
!139 = !DILocation(line: 96, column: 10, scope: !119)
!140 = !DILocation(line: 97, column: 66, scope: !119)
!141 = !DILocation(line: 97, column: 64, scope: !119)
!142 = !DILocation(line: 98, column: 5, scope: !119)
!143 = !DILocation(line: 99, column: 1, scope: !119)
!144 = distinct !DISubprogram(name: "goodG2BSink", scope: !14, file: !14, line: 66, type: !22, scopeLine: 67, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!145 = !DILocalVariable(name: "data", scope: !144, file: !14, line: 68, type: !6)
!146 = !DILocation(line: 68, column: 15, scope: !144)
!147 = !DILocation(line: 68, column: 22, scope: !144)
!148 = !DILocalVariable(name: "i", scope: !149, file: !14, line: 70, type: !77)
!149 = distinct !DILexicalBlock(scope: !144, file: !14, line: 69, column: 5)
!150 = !DILocation(line: 70, column: 16, scope: !149)
!151 = !DILocalVariable(name: "destLen", scope: !149, file: !14, line: 70, type: !77)
!152 = !DILocation(line: 70, column: 19, scope: !149)
!153 = !DILocalVariable(name: "dest", scope: !149, file: !14, line: 71, type: !83)
!154 = !DILocation(line: 71, column: 17, scope: !149)
!155 = !DILocation(line: 72, column: 17, scope: !149)
!156 = !DILocation(line: 72, column: 9, scope: !149)
!157 = !DILocation(line: 73, column: 9, scope: !149)
!158 = !DILocation(line: 73, column: 21, scope: !149)
!159 = !DILocation(line: 74, column: 26, scope: !149)
!160 = !DILocation(line: 74, column: 19, scope: !149)
!161 = !DILocation(line: 74, column: 17, scope: !149)
!162 = !DILocation(line: 77, column: 16, scope: !163)
!163 = distinct !DILexicalBlock(scope: !149, file: !14, line: 77, column: 9)
!164 = !DILocation(line: 77, column: 14, scope: !163)
!165 = !DILocation(line: 77, column: 21, scope: !166)
!166 = distinct !DILexicalBlock(scope: !163, file: !14, line: 77, column: 9)
!167 = !DILocation(line: 77, column: 25, scope: !166)
!168 = !DILocation(line: 77, column: 23, scope: !166)
!169 = !DILocation(line: 77, column: 9, scope: !163)
!170 = !DILocation(line: 79, column: 23, scope: !171)
!171 = distinct !DILexicalBlock(scope: !166, file: !14, line: 78, column: 9)
!172 = !DILocation(line: 79, column: 28, scope: !171)
!173 = !DILocation(line: 79, column: 18, scope: !171)
!174 = !DILocation(line: 79, column: 13, scope: !171)
!175 = !DILocation(line: 79, column: 21, scope: !171)
!176 = !DILocation(line: 80, column: 9, scope: !171)
!177 = !DILocation(line: 77, column: 35, scope: !166)
!178 = !DILocation(line: 77, column: 9, scope: !166)
!179 = distinct !{!179, !169, !180, !113}
!180 = !DILocation(line: 80, column: 9, scope: !163)
!181 = !DILocation(line: 81, column: 9, scope: !149)
!182 = !DILocation(line: 81, column: 21, scope: !149)
!183 = !DILocation(line: 82, column: 20, scope: !149)
!184 = !DILocation(line: 82, column: 9, scope: !149)
!185 = !DILocation(line: 84, column: 1, scope: !144)

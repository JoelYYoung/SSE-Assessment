; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_loop_44.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_loop_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_alloca_loop_44_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !21, metadata !DIExpression()), !dbg !25
  store void (i32*)* @badSink, void (i32*)** %funcPtr, align 8, !dbg !25
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
  %9 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !44
  %10 = load i32*, i32** %data, align 8, !dbg !45
  call void %9(i32* %10), !dbg !44
  ret void, !dbg !46
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i32* %data) #0 !dbg !47 {
entry:
  %data.addr = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !48, metadata !DIExpression()), !dbg !49
  call void @llvm.dbg.declare(metadata i64* %i, metadata !50, metadata !DIExpression()), !dbg !54
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !55, metadata !DIExpression()), !dbg !56
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !57, metadata !DIExpression()), !dbg !61
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !62
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !63
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !64
  store i32 0, i32* %arrayidx, align 4, !dbg !65
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !66
  %call2 = call i64 @wcslen(i32* %arraydecay1) #6, !dbg !67
  store i64 %call2, i64* %destLen, align 8, !dbg !68
  store i64 0, i64* %i, align 8, !dbg !69
  br label %for.cond, !dbg !71

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !72
  %1 = load i64, i64* %destLen, align 8, !dbg !74
  %cmp = icmp ult i64 %0, %1, !dbg !75
  br i1 %cmp, label %for.body, label %for.end, !dbg !76

for.body:                                         ; preds = %for.cond
  %2 = load i32*, i32** %data.addr, align 8, !dbg !77
  %3 = load i64, i64* %i, align 8, !dbg !79
  %arrayidx3 = getelementptr inbounds i32, i32* %2, i64 %3, !dbg !77
  %4 = load i32, i32* %arrayidx3, align 4, !dbg !77
  %5 = load i64, i64* %i, align 8, !dbg !80
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %5, !dbg !81
  store i32 %4, i32* %arrayidx4, align 4, !dbg !82
  br label %for.inc, !dbg !83

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !84
  %inc = add i64 %6, 1, !dbg !84
  store i64 %inc, i64* %i, align 8, !dbg !84
  br label %for.cond, !dbg !85, !llvm.loop !86

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !89
  store i32 0, i32* %arrayidx5, align 4, !dbg !90
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !91
  call void @printWLine(i32* %arraydecay6), !dbg !92
  ret void, !dbg !93
}

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_alloca_loop_44_good() #0 !dbg !94 {
entry:
  call void @goodG2B(), !dbg !95
  ret void, !dbg !96
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !97 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !103, metadata !DIExpression()), !dbg !104
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !105, metadata !DIExpression()), !dbg !106
  %call = call i64 @time(i64* null) #5, !dbg !107
  %conv = trunc i64 %call to i32, !dbg !108
  call void @srand(i32 %conv) #5, !dbg !109
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !110
  call void @CWE126_Buffer_Overread__wchar_t_alloca_loop_44_good(), !dbg !111
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !112
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !113
  call void @CWE126_Buffer_Overread__wchar_t_alloca_loop_44_bad(), !dbg !114
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !115
  ret i32 0, !dbg !116
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !117 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !118, metadata !DIExpression()), !dbg !119
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !120, metadata !DIExpression()), !dbg !121
  store void (i32*)* @goodG2BSink, void (i32*)** %funcPtr, align 8, !dbg !121
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
  %9 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !140
  %10 = load i32*, i32** %data, align 8, !dbg !141
  call void %9(i32* %10), !dbg !140
  ret void, !dbg !142
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i32* %data) #0 !dbg !143 {
entry:
  %data.addr = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !144, metadata !DIExpression()), !dbg !145
  call void @llvm.dbg.declare(metadata i64* %i, metadata !146, metadata !DIExpression()), !dbg !148
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !149, metadata !DIExpression()), !dbg !150
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !151, metadata !DIExpression()), !dbg !152
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !153
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !154
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !155
  store i32 0, i32* %arrayidx, align 4, !dbg !156
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !157
  %call2 = call i64 @wcslen(i32* %arraydecay1) #6, !dbg !158
  store i64 %call2, i64* %destLen, align 8, !dbg !159
  store i64 0, i64* %i, align 8, !dbg !160
  br label %for.cond, !dbg !162

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !163
  %1 = load i64, i64* %destLen, align 8, !dbg !165
  %cmp = icmp ult i64 %0, %1, !dbg !166
  br i1 %cmp, label %for.body, label %for.end, !dbg !167

for.body:                                         ; preds = %for.cond
  %2 = load i32*, i32** %data.addr, align 8, !dbg !168
  %3 = load i64, i64* %i, align 8, !dbg !170
  %arrayidx3 = getelementptr inbounds i32, i32* %2, i64 %3, !dbg !168
  %4 = load i32, i32* %arrayidx3, align 4, !dbg !168
  %5 = load i64, i64* %i, align 8, !dbg !171
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %5, !dbg !172
  store i32 %4, i32* %arrayidx4, align 4, !dbg !173
  br label %for.inc, !dbg !174

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !175
  %inc = add i64 %6, 1, !dbg !175
  store i64 %inc, i64* %i, align 8, !dbg !175
  br label %for.cond, !dbg !176, !llvm.loop !177

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !179
  store i32 0, i32* %arrayidx5, align 4, !dbg !180
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !181
  call void @printWLine(i32* %arraydecay6), !dbg !182
  ret void, !dbg !183
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_loop_44.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"uwtable", i32 1}
!13 = !{i32 7, !"frame-pointer", i32 2}
!14 = !{!"clang version 13.0.0"}
!15 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_loop_44_bad", scope: !16, file: !16, line: 42, type: !17, scopeLine: 43, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_loop_44.c", directory: "/root/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 44, type: !4)
!20 = !DILocation(line: 44, column: 15, scope: !15)
!21 = !DILocalVariable(name: "funcPtr", scope: !15, file: !16, line: 46, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = !DISubroutineType(types: !24)
!24 = !{null, !4}
!25 = !DILocation(line: 46, column: 12, scope: !15)
!26 = !DILocalVariable(name: "dataBadBuffer", scope: !15, file: !16, line: 47, type: !4)
!27 = !DILocation(line: 47, column: 15, scope: !15)
!28 = !DILocation(line: 47, column: 42, scope: !15)
!29 = !DILocation(line: 47, column: 31, scope: !15)
!30 = !DILocalVariable(name: "dataGoodBuffer", scope: !15, file: !16, line: 48, type: !4)
!31 = !DILocation(line: 48, column: 15, scope: !15)
!32 = !DILocation(line: 48, column: 43, scope: !15)
!33 = !DILocation(line: 48, column: 32, scope: !15)
!34 = !DILocation(line: 49, column: 13, scope: !15)
!35 = !DILocation(line: 49, column: 5, scope: !15)
!36 = !DILocation(line: 50, column: 5, scope: !15)
!37 = !DILocation(line: 50, column: 25, scope: !15)
!38 = !DILocation(line: 51, column: 13, scope: !15)
!39 = !DILocation(line: 51, column: 5, scope: !15)
!40 = !DILocation(line: 52, column: 5, scope: !15)
!41 = !DILocation(line: 52, column: 27, scope: !15)
!42 = !DILocation(line: 54, column: 12, scope: !15)
!43 = !DILocation(line: 54, column: 10, scope: !15)
!44 = !DILocation(line: 56, column: 5, scope: !15)
!45 = !DILocation(line: 56, column: 13, scope: !15)
!46 = !DILocation(line: 57, column: 1, scope: !15)
!47 = distinct !DISubprogram(name: "badSink", scope: !16, file: !16, line: 23, type: !23, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!48 = !DILocalVariable(name: "data", arg: 1, scope: !47, file: !16, line: 23, type: !4)
!49 = !DILocation(line: 23, column: 31, scope: !47)
!50 = !DILocalVariable(name: "i", scope: !51, file: !16, line: 26, type: !52)
!51 = distinct !DILexicalBlock(scope: !47, file: !16, line: 25, column: 5)
!52 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !53)
!53 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!54 = !DILocation(line: 26, column: 16, scope: !51)
!55 = !DILocalVariable(name: "destLen", scope: !51, file: !16, line: 26, type: !52)
!56 = !DILocation(line: 26, column: 19, scope: !51)
!57 = !DILocalVariable(name: "dest", scope: !51, file: !16, line: 27, type: !58)
!58 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !59)
!59 = !{!60}
!60 = !DISubrange(count: 100)
!61 = !DILocation(line: 27, column: 17, scope: !51)
!62 = !DILocation(line: 28, column: 17, scope: !51)
!63 = !DILocation(line: 28, column: 9, scope: !51)
!64 = !DILocation(line: 29, column: 9, scope: !51)
!65 = !DILocation(line: 29, column: 21, scope: !51)
!66 = !DILocation(line: 30, column: 26, scope: !51)
!67 = !DILocation(line: 30, column: 19, scope: !51)
!68 = !DILocation(line: 30, column: 17, scope: !51)
!69 = !DILocation(line: 33, column: 16, scope: !70)
!70 = distinct !DILexicalBlock(scope: !51, file: !16, line: 33, column: 9)
!71 = !DILocation(line: 33, column: 14, scope: !70)
!72 = !DILocation(line: 33, column: 21, scope: !73)
!73 = distinct !DILexicalBlock(scope: !70, file: !16, line: 33, column: 9)
!74 = !DILocation(line: 33, column: 25, scope: !73)
!75 = !DILocation(line: 33, column: 23, scope: !73)
!76 = !DILocation(line: 33, column: 9, scope: !70)
!77 = !DILocation(line: 35, column: 23, scope: !78)
!78 = distinct !DILexicalBlock(scope: !73, file: !16, line: 34, column: 9)
!79 = !DILocation(line: 35, column: 28, scope: !78)
!80 = !DILocation(line: 35, column: 18, scope: !78)
!81 = !DILocation(line: 35, column: 13, scope: !78)
!82 = !DILocation(line: 35, column: 21, scope: !78)
!83 = !DILocation(line: 36, column: 9, scope: !78)
!84 = !DILocation(line: 33, column: 35, scope: !73)
!85 = !DILocation(line: 33, column: 9, scope: !73)
!86 = distinct !{!86, !76, !87, !88}
!87 = !DILocation(line: 36, column: 9, scope: !70)
!88 = !{!"llvm.loop.mustprogress"}
!89 = !DILocation(line: 37, column: 9, scope: !51)
!90 = !DILocation(line: 37, column: 21, scope: !51)
!91 = !DILocation(line: 38, column: 20, scope: !51)
!92 = !DILocation(line: 38, column: 9, scope: !51)
!93 = !DILocation(line: 40, column: 1, scope: !47)
!94 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_loop_44_good", scope: !16, file: !16, line: 98, type: !17, scopeLine: 99, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!95 = !DILocation(line: 100, column: 5, scope: !94)
!96 = !DILocation(line: 101, column: 1, scope: !94)
!97 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 112, type: !98, scopeLine: 113, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!98 = !DISubroutineType(types: !99)
!99 = !{!7, !7, !100}
!100 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !101, size: 64)
!101 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !102, size: 64)
!102 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!103 = !DILocalVariable(name: "argc", arg: 1, scope: !97, file: !16, line: 112, type: !7)
!104 = !DILocation(line: 112, column: 14, scope: !97)
!105 = !DILocalVariable(name: "argv", arg: 2, scope: !97, file: !16, line: 112, type: !100)
!106 = !DILocation(line: 112, column: 27, scope: !97)
!107 = !DILocation(line: 115, column: 22, scope: !97)
!108 = !DILocation(line: 115, column: 12, scope: !97)
!109 = !DILocation(line: 115, column: 5, scope: !97)
!110 = !DILocation(line: 117, column: 5, scope: !97)
!111 = !DILocation(line: 118, column: 5, scope: !97)
!112 = !DILocation(line: 119, column: 5, scope: !97)
!113 = !DILocation(line: 122, column: 5, scope: !97)
!114 = !DILocation(line: 123, column: 5, scope: !97)
!115 = !DILocation(line: 124, column: 5, scope: !97)
!116 = !DILocation(line: 126, column: 5, scope: !97)
!117 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 83, type: !17, scopeLine: 84, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!118 = !DILocalVariable(name: "data", scope: !117, file: !16, line: 85, type: !4)
!119 = !DILocation(line: 85, column: 15, scope: !117)
!120 = !DILocalVariable(name: "funcPtr", scope: !117, file: !16, line: 86, type: !22)
!121 = !DILocation(line: 86, column: 12, scope: !117)
!122 = !DILocalVariable(name: "dataBadBuffer", scope: !117, file: !16, line: 87, type: !4)
!123 = !DILocation(line: 87, column: 15, scope: !117)
!124 = !DILocation(line: 87, column: 42, scope: !117)
!125 = !DILocation(line: 87, column: 31, scope: !117)
!126 = !DILocalVariable(name: "dataGoodBuffer", scope: !117, file: !16, line: 88, type: !4)
!127 = !DILocation(line: 88, column: 15, scope: !117)
!128 = !DILocation(line: 88, column: 43, scope: !117)
!129 = !DILocation(line: 88, column: 32, scope: !117)
!130 = !DILocation(line: 89, column: 13, scope: !117)
!131 = !DILocation(line: 89, column: 5, scope: !117)
!132 = !DILocation(line: 90, column: 5, scope: !117)
!133 = !DILocation(line: 90, column: 25, scope: !117)
!134 = !DILocation(line: 91, column: 13, scope: !117)
!135 = !DILocation(line: 91, column: 5, scope: !117)
!136 = !DILocation(line: 92, column: 5, scope: !117)
!137 = !DILocation(line: 92, column: 27, scope: !117)
!138 = !DILocation(line: 94, column: 12, scope: !117)
!139 = !DILocation(line: 94, column: 10, scope: !117)
!140 = !DILocation(line: 95, column: 5, scope: !117)
!141 = !DILocation(line: 95, column: 13, scope: !117)
!142 = !DILocation(line: 96, column: 1, scope: !117)
!143 = distinct !DISubprogram(name: "goodG2BSink", scope: !16, file: !16, line: 64, type: !23, scopeLine: 65, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!144 = !DILocalVariable(name: "data", arg: 1, scope: !143, file: !16, line: 64, type: !4)
!145 = !DILocation(line: 64, column: 35, scope: !143)
!146 = !DILocalVariable(name: "i", scope: !147, file: !16, line: 67, type: !52)
!147 = distinct !DILexicalBlock(scope: !143, file: !16, line: 66, column: 5)
!148 = !DILocation(line: 67, column: 16, scope: !147)
!149 = !DILocalVariable(name: "destLen", scope: !147, file: !16, line: 67, type: !52)
!150 = !DILocation(line: 67, column: 19, scope: !147)
!151 = !DILocalVariable(name: "dest", scope: !147, file: !16, line: 68, type: !58)
!152 = !DILocation(line: 68, column: 17, scope: !147)
!153 = !DILocation(line: 69, column: 17, scope: !147)
!154 = !DILocation(line: 69, column: 9, scope: !147)
!155 = !DILocation(line: 70, column: 9, scope: !147)
!156 = !DILocation(line: 70, column: 21, scope: !147)
!157 = !DILocation(line: 71, column: 26, scope: !147)
!158 = !DILocation(line: 71, column: 19, scope: !147)
!159 = !DILocation(line: 71, column: 17, scope: !147)
!160 = !DILocation(line: 74, column: 16, scope: !161)
!161 = distinct !DILexicalBlock(scope: !147, file: !16, line: 74, column: 9)
!162 = !DILocation(line: 74, column: 14, scope: !161)
!163 = !DILocation(line: 74, column: 21, scope: !164)
!164 = distinct !DILexicalBlock(scope: !161, file: !16, line: 74, column: 9)
!165 = !DILocation(line: 74, column: 25, scope: !164)
!166 = !DILocation(line: 74, column: 23, scope: !164)
!167 = !DILocation(line: 74, column: 9, scope: !161)
!168 = !DILocation(line: 76, column: 23, scope: !169)
!169 = distinct !DILexicalBlock(scope: !164, file: !16, line: 75, column: 9)
!170 = !DILocation(line: 76, column: 28, scope: !169)
!171 = !DILocation(line: 76, column: 18, scope: !169)
!172 = !DILocation(line: 76, column: 13, scope: !169)
!173 = !DILocation(line: 76, column: 21, scope: !169)
!174 = !DILocation(line: 77, column: 9, scope: !169)
!175 = !DILocation(line: 74, column: 35, scope: !164)
!176 = !DILocation(line: 74, column: 9, scope: !164)
!177 = distinct !{!177, !167, !178, !88}
!178 = !DILocation(line: 77, column: 9, scope: !161)
!179 = !DILocation(line: 78, column: 9, scope: !147)
!180 = !DILocation(line: 78, column: 21, scope: !147)
!181 = !DILocation(line: 79, column: 20, scope: !147)
!182 = !DILocation(line: 79, column: 9, scope: !147)
!183 = !DILocation(line: 81, column: 1, scope: !143)

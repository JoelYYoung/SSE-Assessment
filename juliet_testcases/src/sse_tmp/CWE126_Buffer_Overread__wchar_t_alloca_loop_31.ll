; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_loop_31.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_loop_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_alloca_loop_31_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %dataCopy = alloca i32*, align 8
  %data3 = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = alloca i8, i64 200, align 16, !dbg !23
  %1 = bitcast i8* %0 to i32*, !dbg !24
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !25, metadata !DIExpression()), !dbg !26
  %2 = alloca i8, i64 400, align 16, !dbg !27
  %3 = bitcast i8* %2 to i32*, !dbg !28
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !26
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !29
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #5, !dbg !30
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !31
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !31
  store i32 0, i32* %arrayidx, align 4, !dbg !32
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !33
  %call1 = call i32* @wmemset(i32* %6, i32 65, i64 99) #5, !dbg !34
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !35
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !35
  store i32 0, i32* %arrayidx2, align 4, !dbg !36
  %8 = load i32*, i32** %dataBadBuffer, align 8, !dbg !37
  store i32* %8, i32** %data, align 8, !dbg !38
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !39, metadata !DIExpression()), !dbg !41
  %9 = load i32*, i32** %data, align 8, !dbg !42
  store i32* %9, i32** %dataCopy, align 8, !dbg !41
  call void @llvm.dbg.declare(metadata i32** %data3, metadata !43, metadata !DIExpression()), !dbg !44
  %10 = load i32*, i32** %dataCopy, align 8, !dbg !45
  store i32* %10, i32** %data3, align 8, !dbg !44
  call void @llvm.dbg.declare(metadata i64* %i, metadata !46, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !51, metadata !DIExpression()), !dbg !52
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !53, metadata !DIExpression()), !dbg !57
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !58
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !59
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !60
  store i32 0, i32* %arrayidx5, align 4, !dbg !61
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !62
  %call7 = call i64 @wcslen(i32* %arraydecay6) #6, !dbg !63
  store i64 %call7, i64* %destLen, align 8, !dbg !64
  store i64 0, i64* %i, align 8, !dbg !65
  br label %for.cond, !dbg !67

for.cond:                                         ; preds = %for.inc, %entry
  %11 = load i64, i64* %i, align 8, !dbg !68
  %12 = load i64, i64* %destLen, align 8, !dbg !70
  %cmp = icmp ult i64 %11, %12, !dbg !71
  br i1 %cmp, label %for.body, label %for.end, !dbg !72

for.body:                                         ; preds = %for.cond
  %13 = load i32*, i32** %data3, align 8, !dbg !73
  %14 = load i64, i64* %i, align 8, !dbg !75
  %arrayidx8 = getelementptr inbounds i32, i32* %13, i64 %14, !dbg !73
  %15 = load i32, i32* %arrayidx8, align 4, !dbg !73
  %16 = load i64, i64* %i, align 8, !dbg !76
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %16, !dbg !77
  store i32 %15, i32* %arrayidx9, align 4, !dbg !78
  br label %for.inc, !dbg !79

for.inc:                                          ; preds = %for.body
  %17 = load i64, i64* %i, align 8, !dbg !80
  %inc = add i64 %17, 1, !dbg !80
  store i64 %inc, i64* %i, align 8, !dbg !80
  br label %for.cond, !dbg !81, !llvm.loop !82

for.end:                                          ; preds = %for.cond
  %arrayidx10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !85
  store i32 0, i32* %arrayidx10, align 4, !dbg !86
  %arraydecay11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !87
  call void @printWLine(i32* %arraydecay11), !dbg !88
  ret void, !dbg !89
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_alloca_loop_31_good() #0 !dbg !90 {
entry:
  call void @goodG2B(), !dbg !91
  ret void, !dbg !92
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !93 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !99, metadata !DIExpression()), !dbg !100
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !101, metadata !DIExpression()), !dbg !102
  %call = call i64 @time(i64* null) #5, !dbg !103
  %conv = trunc i64 %call to i32, !dbg !104
  call void @srand(i32 %conv) #5, !dbg !105
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !106
  call void @CWE126_Buffer_Overread__wchar_t_alloca_loop_31_good(), !dbg !107
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !108
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !109
  call void @CWE126_Buffer_Overread__wchar_t_alloca_loop_31_bad(), !dbg !110
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !111
  ret i32 0, !dbg !112
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !113 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %dataCopy = alloca i32*, align 8
  %data3 = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !114, metadata !DIExpression()), !dbg !115
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !116, metadata !DIExpression()), !dbg !117
  %0 = alloca i8, i64 200, align 16, !dbg !118
  %1 = bitcast i8* %0 to i32*, !dbg !119
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !117
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !120, metadata !DIExpression()), !dbg !121
  %2 = alloca i8, i64 400, align 16, !dbg !122
  %3 = bitcast i8* %2 to i32*, !dbg !123
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !121
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !124
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #5, !dbg !125
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !126
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !126
  store i32 0, i32* %arrayidx, align 4, !dbg !127
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !128
  %call1 = call i32* @wmemset(i32* %6, i32 65, i64 99) #5, !dbg !129
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !130
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !130
  store i32 0, i32* %arrayidx2, align 4, !dbg !131
  %8 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !132
  store i32* %8, i32** %data, align 8, !dbg !133
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !134, metadata !DIExpression()), !dbg !136
  %9 = load i32*, i32** %data, align 8, !dbg !137
  store i32* %9, i32** %dataCopy, align 8, !dbg !136
  call void @llvm.dbg.declare(metadata i32** %data3, metadata !138, metadata !DIExpression()), !dbg !139
  %10 = load i32*, i32** %dataCopy, align 8, !dbg !140
  store i32* %10, i32** %data3, align 8, !dbg !139
  call void @llvm.dbg.declare(metadata i64* %i, metadata !141, metadata !DIExpression()), !dbg !143
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !144, metadata !DIExpression()), !dbg !145
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !146, metadata !DIExpression()), !dbg !147
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !148
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !149
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !150
  store i32 0, i32* %arrayidx5, align 4, !dbg !151
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !152
  %call7 = call i64 @wcslen(i32* %arraydecay6) #6, !dbg !153
  store i64 %call7, i64* %destLen, align 8, !dbg !154
  store i64 0, i64* %i, align 8, !dbg !155
  br label %for.cond, !dbg !157

for.cond:                                         ; preds = %for.inc, %entry
  %11 = load i64, i64* %i, align 8, !dbg !158
  %12 = load i64, i64* %destLen, align 8, !dbg !160
  %cmp = icmp ult i64 %11, %12, !dbg !161
  br i1 %cmp, label %for.body, label %for.end, !dbg !162

for.body:                                         ; preds = %for.cond
  %13 = load i32*, i32** %data3, align 8, !dbg !163
  %14 = load i64, i64* %i, align 8, !dbg !165
  %arrayidx8 = getelementptr inbounds i32, i32* %13, i64 %14, !dbg !163
  %15 = load i32, i32* %arrayidx8, align 4, !dbg !163
  %16 = load i64, i64* %i, align 8, !dbg !166
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %16, !dbg !167
  store i32 %15, i32* %arrayidx9, align 4, !dbg !168
  br label %for.inc, !dbg !169

for.inc:                                          ; preds = %for.body
  %17 = load i64, i64* %i, align 8, !dbg !170
  %inc = add i64 %17, 1, !dbg !170
  store i64 %inc, i64* %i, align 8, !dbg !170
  br label %for.cond, !dbg !171, !llvm.loop !172

for.end:                                          ; preds = %for.cond
  %arrayidx10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !174
  store i32 0, i32* %arrayidx10, align 4, !dbg !175
  %arraydecay11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !176
  call void @printWLine(i32* %arraydecay11), !dbg !177
  ret void, !dbg !178
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_loop_31.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"uwtable", i32 1}
!13 = !{i32 7, !"frame-pointer", i32 2}
!14 = !{!"clang version 13.0.0"}
!15 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_loop_31_bad", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_loop_31.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 25, type: !4)
!20 = !DILocation(line: 25, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataBadBuffer", scope: !15, file: !16, line: 26, type: !4)
!22 = !DILocation(line: 26, column: 15, scope: !15)
!23 = !DILocation(line: 26, column: 42, scope: !15)
!24 = !DILocation(line: 26, column: 31, scope: !15)
!25 = !DILocalVariable(name: "dataGoodBuffer", scope: !15, file: !16, line: 27, type: !4)
!26 = !DILocation(line: 27, column: 15, scope: !15)
!27 = !DILocation(line: 27, column: 43, scope: !15)
!28 = !DILocation(line: 27, column: 32, scope: !15)
!29 = !DILocation(line: 28, column: 13, scope: !15)
!30 = !DILocation(line: 28, column: 5, scope: !15)
!31 = !DILocation(line: 29, column: 5, scope: !15)
!32 = !DILocation(line: 29, column: 25, scope: !15)
!33 = !DILocation(line: 30, column: 13, scope: !15)
!34 = !DILocation(line: 30, column: 5, scope: !15)
!35 = !DILocation(line: 31, column: 5, scope: !15)
!36 = !DILocation(line: 31, column: 27, scope: !15)
!37 = !DILocation(line: 33, column: 12, scope: !15)
!38 = !DILocation(line: 33, column: 10, scope: !15)
!39 = !DILocalVariable(name: "dataCopy", scope: !40, file: !16, line: 35, type: !4)
!40 = distinct !DILexicalBlock(scope: !15, file: !16, line: 34, column: 5)
!41 = !DILocation(line: 35, column: 19, scope: !40)
!42 = !DILocation(line: 35, column: 30, scope: !40)
!43 = !DILocalVariable(name: "data", scope: !40, file: !16, line: 36, type: !4)
!44 = !DILocation(line: 36, column: 19, scope: !40)
!45 = !DILocation(line: 36, column: 26, scope: !40)
!46 = !DILocalVariable(name: "i", scope: !47, file: !16, line: 38, type: !48)
!47 = distinct !DILexicalBlock(scope: !40, file: !16, line: 37, column: 9)
!48 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !49)
!49 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!50 = !DILocation(line: 38, column: 20, scope: !47)
!51 = !DILocalVariable(name: "destLen", scope: !47, file: !16, line: 38, type: !48)
!52 = !DILocation(line: 38, column: 23, scope: !47)
!53 = !DILocalVariable(name: "dest", scope: !47, file: !16, line: 39, type: !54)
!54 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !55)
!55 = !{!56}
!56 = !DISubrange(count: 100)
!57 = !DILocation(line: 39, column: 21, scope: !47)
!58 = !DILocation(line: 40, column: 21, scope: !47)
!59 = !DILocation(line: 40, column: 13, scope: !47)
!60 = !DILocation(line: 41, column: 13, scope: !47)
!61 = !DILocation(line: 41, column: 25, scope: !47)
!62 = !DILocation(line: 42, column: 30, scope: !47)
!63 = !DILocation(line: 42, column: 23, scope: !47)
!64 = !DILocation(line: 42, column: 21, scope: !47)
!65 = !DILocation(line: 45, column: 20, scope: !66)
!66 = distinct !DILexicalBlock(scope: !47, file: !16, line: 45, column: 13)
!67 = !DILocation(line: 45, column: 18, scope: !66)
!68 = !DILocation(line: 45, column: 25, scope: !69)
!69 = distinct !DILexicalBlock(scope: !66, file: !16, line: 45, column: 13)
!70 = !DILocation(line: 45, column: 29, scope: !69)
!71 = !DILocation(line: 45, column: 27, scope: !69)
!72 = !DILocation(line: 45, column: 13, scope: !66)
!73 = !DILocation(line: 47, column: 27, scope: !74)
!74 = distinct !DILexicalBlock(scope: !69, file: !16, line: 46, column: 13)
!75 = !DILocation(line: 47, column: 32, scope: !74)
!76 = !DILocation(line: 47, column: 22, scope: !74)
!77 = !DILocation(line: 47, column: 17, scope: !74)
!78 = !DILocation(line: 47, column: 25, scope: !74)
!79 = !DILocation(line: 48, column: 13, scope: !74)
!80 = !DILocation(line: 45, column: 39, scope: !69)
!81 = !DILocation(line: 45, column: 13, scope: !69)
!82 = distinct !{!82, !72, !83, !84}
!83 = !DILocation(line: 48, column: 13, scope: !66)
!84 = !{!"llvm.loop.mustprogress"}
!85 = !DILocation(line: 49, column: 13, scope: !47)
!86 = !DILocation(line: 49, column: 25, scope: !47)
!87 = !DILocation(line: 50, column: 24, scope: !47)
!88 = !DILocation(line: 50, column: 13, scope: !47)
!89 = !DILocation(line: 53, column: 1, scope: !15)
!90 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_loop_31_good", scope: !16, file: !16, line: 92, type: !17, scopeLine: 93, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!91 = !DILocation(line: 94, column: 5, scope: !90)
!92 = !DILocation(line: 95, column: 1, scope: !90)
!93 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 106, type: !94, scopeLine: 107, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!94 = !DISubroutineType(types: !95)
!95 = !{!7, !7, !96}
!96 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !97, size: 64)
!97 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !98, size: 64)
!98 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!99 = !DILocalVariable(name: "argc", arg: 1, scope: !93, file: !16, line: 106, type: !7)
!100 = !DILocation(line: 106, column: 14, scope: !93)
!101 = !DILocalVariable(name: "argv", arg: 2, scope: !93, file: !16, line: 106, type: !96)
!102 = !DILocation(line: 106, column: 27, scope: !93)
!103 = !DILocation(line: 109, column: 22, scope: !93)
!104 = !DILocation(line: 109, column: 12, scope: !93)
!105 = !DILocation(line: 109, column: 5, scope: !93)
!106 = !DILocation(line: 111, column: 5, scope: !93)
!107 = !DILocation(line: 112, column: 5, scope: !93)
!108 = !DILocation(line: 113, column: 5, scope: !93)
!109 = !DILocation(line: 116, column: 5, scope: !93)
!110 = !DILocation(line: 117, column: 5, scope: !93)
!111 = !DILocation(line: 118, column: 5, scope: !93)
!112 = !DILocation(line: 120, column: 5, scope: !93)
!113 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 60, type: !17, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!114 = !DILocalVariable(name: "data", scope: !113, file: !16, line: 62, type: !4)
!115 = !DILocation(line: 62, column: 15, scope: !113)
!116 = !DILocalVariable(name: "dataBadBuffer", scope: !113, file: !16, line: 63, type: !4)
!117 = !DILocation(line: 63, column: 15, scope: !113)
!118 = !DILocation(line: 63, column: 42, scope: !113)
!119 = !DILocation(line: 63, column: 31, scope: !113)
!120 = !DILocalVariable(name: "dataGoodBuffer", scope: !113, file: !16, line: 64, type: !4)
!121 = !DILocation(line: 64, column: 15, scope: !113)
!122 = !DILocation(line: 64, column: 43, scope: !113)
!123 = !DILocation(line: 64, column: 32, scope: !113)
!124 = !DILocation(line: 65, column: 13, scope: !113)
!125 = !DILocation(line: 65, column: 5, scope: !113)
!126 = !DILocation(line: 66, column: 5, scope: !113)
!127 = !DILocation(line: 66, column: 25, scope: !113)
!128 = !DILocation(line: 67, column: 13, scope: !113)
!129 = !DILocation(line: 67, column: 5, scope: !113)
!130 = !DILocation(line: 68, column: 5, scope: !113)
!131 = !DILocation(line: 68, column: 27, scope: !113)
!132 = !DILocation(line: 70, column: 12, scope: !113)
!133 = !DILocation(line: 70, column: 10, scope: !113)
!134 = !DILocalVariable(name: "dataCopy", scope: !135, file: !16, line: 72, type: !4)
!135 = distinct !DILexicalBlock(scope: !113, file: !16, line: 71, column: 5)
!136 = !DILocation(line: 72, column: 19, scope: !135)
!137 = !DILocation(line: 72, column: 30, scope: !135)
!138 = !DILocalVariable(name: "data", scope: !135, file: !16, line: 73, type: !4)
!139 = !DILocation(line: 73, column: 19, scope: !135)
!140 = !DILocation(line: 73, column: 26, scope: !135)
!141 = !DILocalVariable(name: "i", scope: !142, file: !16, line: 75, type: !48)
!142 = distinct !DILexicalBlock(scope: !135, file: !16, line: 74, column: 9)
!143 = !DILocation(line: 75, column: 20, scope: !142)
!144 = !DILocalVariable(name: "destLen", scope: !142, file: !16, line: 75, type: !48)
!145 = !DILocation(line: 75, column: 23, scope: !142)
!146 = !DILocalVariable(name: "dest", scope: !142, file: !16, line: 76, type: !54)
!147 = !DILocation(line: 76, column: 21, scope: !142)
!148 = !DILocation(line: 77, column: 21, scope: !142)
!149 = !DILocation(line: 77, column: 13, scope: !142)
!150 = !DILocation(line: 78, column: 13, scope: !142)
!151 = !DILocation(line: 78, column: 25, scope: !142)
!152 = !DILocation(line: 79, column: 30, scope: !142)
!153 = !DILocation(line: 79, column: 23, scope: !142)
!154 = !DILocation(line: 79, column: 21, scope: !142)
!155 = !DILocation(line: 82, column: 20, scope: !156)
!156 = distinct !DILexicalBlock(scope: !142, file: !16, line: 82, column: 13)
!157 = !DILocation(line: 82, column: 18, scope: !156)
!158 = !DILocation(line: 82, column: 25, scope: !159)
!159 = distinct !DILexicalBlock(scope: !156, file: !16, line: 82, column: 13)
!160 = !DILocation(line: 82, column: 29, scope: !159)
!161 = !DILocation(line: 82, column: 27, scope: !159)
!162 = !DILocation(line: 82, column: 13, scope: !156)
!163 = !DILocation(line: 84, column: 27, scope: !164)
!164 = distinct !DILexicalBlock(scope: !159, file: !16, line: 83, column: 13)
!165 = !DILocation(line: 84, column: 32, scope: !164)
!166 = !DILocation(line: 84, column: 22, scope: !164)
!167 = !DILocation(line: 84, column: 17, scope: !164)
!168 = !DILocation(line: 84, column: 25, scope: !164)
!169 = !DILocation(line: 85, column: 13, scope: !164)
!170 = !DILocation(line: 82, column: 39, scope: !159)
!171 = !DILocation(line: 82, column: 13, scope: !159)
!172 = distinct !{!172, !162, !173, !84}
!173 = !DILocation(line: 85, column: 13, scope: !156)
!174 = !DILocation(line: 86, column: 13, scope: !142)
!175 = !DILocation(line: 86, column: 25, scope: !142)
!176 = !DILocation(line: 87, column: 24, scope: !142)
!177 = !DILocation(line: 87, column: 13, scope: !142)
!178 = !DILocation(line: 90, column: 1, scope: !113)

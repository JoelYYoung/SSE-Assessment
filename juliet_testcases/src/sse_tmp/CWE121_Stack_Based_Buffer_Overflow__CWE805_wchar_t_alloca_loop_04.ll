; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_04.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_04.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_04_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
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
  store i32* %4, i32** %data, align 8, !dbg !32
  %5 = load i32*, i32** %data, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !33
  store i32 0, i32* %arrayidx, align 4, !dbg !34
  call void @llvm.dbg.declare(metadata i64* %i, metadata !35, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !40, metadata !DIExpression()), !dbg !44
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !45
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !46
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !47
  store i32 0, i32* %arrayidx1, align 4, !dbg !48
  store i64 0, i64* %i, align 8, !dbg !49
  br label %for.cond, !dbg !51

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !52
  %cmp = icmp ult i64 %6, 100, !dbg !54
  br i1 %cmp, label %for.body, label %for.end, !dbg !55

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !56
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %7, !dbg !58
  %8 = load i32, i32* %arrayidx2, align 4, !dbg !58
  %9 = load i32*, i32** %data, align 8, !dbg !59
  %10 = load i64, i64* %i, align 8, !dbg !60
  %arrayidx3 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !59
  store i32 %8, i32* %arrayidx3, align 4, !dbg !61
  br label %for.inc, !dbg !62

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !63
  %inc = add i64 %11, 1, !dbg !63
  store i64 %inc, i64* %i, align 8, !dbg !63
  br label %for.cond, !dbg !64, !llvm.loop !65

for.end:                                          ; preds = %for.cond
  %12 = load i32*, i32** %data, align 8, !dbg !68
  %arrayidx4 = getelementptr inbounds i32, i32* %12, i64 99, !dbg !68
  store i32 0, i32* %arrayidx4, align 4, !dbg !69
  %13 = load i32*, i32** %data, align 8, !dbg !70
  call void @printWLine(i32* %13), !dbg !71
  ret void, !dbg !72
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_04_good() #0 !dbg !73 {
entry:
  call void @goodG2B1(), !dbg !74
  call void @goodG2B2(), !dbg !75
  ret void, !dbg !76
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !77 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !83, metadata !DIExpression()), !dbg !84
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !85, metadata !DIExpression()), !dbg !86
  %call = call i64 @time(i64* null) #4, !dbg !87
  %conv = trunc i64 %call to i32, !dbg !88
  call void @srand(i32 %conv) #4, !dbg !89
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !90
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_04_good(), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !93
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_04_bad(), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !95
  ret i32 0, !dbg !96
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !97 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !98, metadata !DIExpression()), !dbg !99
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !100, metadata !DIExpression()), !dbg !101
  %0 = alloca i8, i64 200, align 16, !dbg !102
  %1 = bitcast i8* %0 to i32*, !dbg !103
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !101
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !104, metadata !DIExpression()), !dbg !105
  %2 = alloca i8, i64 400, align 16, !dbg !106
  %3 = bitcast i8* %2 to i32*, !dbg !107
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !105
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !108
  store i32* %4, i32** %data, align 8, !dbg !111
  %5 = load i32*, i32** %data, align 8, !dbg !112
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !112
  store i32 0, i32* %arrayidx, align 4, !dbg !113
  call void @llvm.dbg.declare(metadata i64* %i, metadata !114, metadata !DIExpression()), !dbg !116
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !117, metadata !DIExpression()), !dbg !118
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !119
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !120
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !121
  store i32 0, i32* %arrayidx1, align 4, !dbg !122
  store i64 0, i64* %i, align 8, !dbg !123
  br label %for.cond, !dbg !125

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !126
  %cmp = icmp ult i64 %6, 100, !dbg !128
  br i1 %cmp, label %for.body, label %for.end, !dbg !129

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !130
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %7, !dbg !132
  %8 = load i32, i32* %arrayidx2, align 4, !dbg !132
  %9 = load i32*, i32** %data, align 8, !dbg !133
  %10 = load i64, i64* %i, align 8, !dbg !134
  %arrayidx3 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !133
  store i32 %8, i32* %arrayidx3, align 4, !dbg !135
  br label %for.inc, !dbg !136

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !137
  %inc = add i64 %11, 1, !dbg !137
  store i64 %inc, i64* %i, align 8, !dbg !137
  br label %for.cond, !dbg !138, !llvm.loop !139

for.end:                                          ; preds = %for.cond
  %12 = load i32*, i32** %data, align 8, !dbg !141
  %arrayidx4 = getelementptr inbounds i32, i32* %12, i64 99, !dbg !141
  store i32 0, i32* %arrayidx4, align 4, !dbg !142
  %13 = load i32*, i32** %data, align 8, !dbg !143
  call void @printWLine(i32* %13), !dbg !144
  ret void, !dbg !145
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !146 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !147, metadata !DIExpression()), !dbg !148
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !149, metadata !DIExpression()), !dbg !150
  %0 = alloca i8, i64 200, align 16, !dbg !151
  %1 = bitcast i8* %0 to i32*, !dbg !152
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !150
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !153, metadata !DIExpression()), !dbg !154
  %2 = alloca i8, i64 400, align 16, !dbg !155
  %3 = bitcast i8* %2 to i32*, !dbg !156
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !154
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !157
  store i32* %4, i32** %data, align 8, !dbg !160
  %5 = load i32*, i32** %data, align 8, !dbg !161
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !161
  store i32 0, i32* %arrayidx, align 4, !dbg !162
  call void @llvm.dbg.declare(metadata i64* %i, metadata !163, metadata !DIExpression()), !dbg !165
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !166, metadata !DIExpression()), !dbg !167
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !168
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !169
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !170
  store i32 0, i32* %arrayidx1, align 4, !dbg !171
  store i64 0, i64* %i, align 8, !dbg !172
  br label %for.cond, !dbg !174

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !175
  %cmp = icmp ult i64 %6, 100, !dbg !177
  br i1 %cmp, label %for.body, label %for.end, !dbg !178

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !179
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %7, !dbg !181
  %8 = load i32, i32* %arrayidx2, align 4, !dbg !181
  %9 = load i32*, i32** %data, align 8, !dbg !182
  %10 = load i64, i64* %i, align 8, !dbg !183
  %arrayidx3 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !182
  store i32 %8, i32* %arrayidx3, align 4, !dbg !184
  br label %for.inc, !dbg !185

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !186
  %inc = add i64 %11, 1, !dbg !186
  store i64 %inc, i64* %i, align 8, !dbg !186
  br label %for.cond, !dbg !187, !llvm.loop !188

for.end:                                          ; preds = %for.cond
  %12 = load i32*, i32** %data, align 8, !dbg !190
  %arrayidx4 = getelementptr inbounds i32, i32* %12, i64 99, !dbg !190
  store i32 0, i32* %arrayidx4, align 4, !dbg !191
  %13 = load i32*, i32** %data, align 8, !dbg !192
  call void @printWLine(i32* %13), !dbg !193
  ret void, !dbg !194
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_04.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_04_bad", scope: !16, file: !16, line: 30, type: !17, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_04.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 32, type: !4)
!20 = !DILocation(line: 32, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataBadBuffer", scope: !15, file: !16, line: 33, type: !4)
!22 = !DILocation(line: 33, column: 15, scope: !15)
!23 = !DILocation(line: 33, column: 42, scope: !15)
!24 = !DILocation(line: 33, column: 31, scope: !15)
!25 = !DILocalVariable(name: "dataGoodBuffer", scope: !15, file: !16, line: 34, type: !4)
!26 = !DILocation(line: 34, column: 15, scope: !15)
!27 = !DILocation(line: 34, column: 43, scope: !15)
!28 = !DILocation(line: 34, column: 32, scope: !15)
!29 = !DILocation(line: 39, column: 16, scope: !30)
!30 = distinct !DILexicalBlock(scope: !31, file: !16, line: 36, column: 5)
!31 = distinct !DILexicalBlock(scope: !15, file: !16, line: 35, column: 8)
!32 = !DILocation(line: 39, column: 14, scope: !30)
!33 = !DILocation(line: 40, column: 9, scope: !30)
!34 = !DILocation(line: 40, column: 17, scope: !30)
!35 = !DILocalVariable(name: "i", scope: !36, file: !16, line: 43, type: !37)
!36 = distinct !DILexicalBlock(scope: !15, file: !16, line: 42, column: 5)
!37 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !38)
!38 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!39 = !DILocation(line: 43, column: 16, scope: !36)
!40 = !DILocalVariable(name: "source", scope: !36, file: !16, line: 44, type: !41)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 100)
!44 = !DILocation(line: 44, column: 17, scope: !36)
!45 = !DILocation(line: 45, column: 17, scope: !36)
!46 = !DILocation(line: 45, column: 9, scope: !36)
!47 = !DILocation(line: 46, column: 9, scope: !36)
!48 = !DILocation(line: 46, column: 23, scope: !36)
!49 = !DILocation(line: 48, column: 16, scope: !50)
!50 = distinct !DILexicalBlock(scope: !36, file: !16, line: 48, column: 9)
!51 = !DILocation(line: 48, column: 14, scope: !50)
!52 = !DILocation(line: 48, column: 21, scope: !53)
!53 = distinct !DILexicalBlock(scope: !50, file: !16, line: 48, column: 9)
!54 = !DILocation(line: 48, column: 23, scope: !53)
!55 = !DILocation(line: 48, column: 9, scope: !50)
!56 = !DILocation(line: 50, column: 30, scope: !57)
!57 = distinct !DILexicalBlock(scope: !53, file: !16, line: 49, column: 9)
!58 = !DILocation(line: 50, column: 23, scope: !57)
!59 = !DILocation(line: 50, column: 13, scope: !57)
!60 = !DILocation(line: 50, column: 18, scope: !57)
!61 = !DILocation(line: 50, column: 21, scope: !57)
!62 = !DILocation(line: 51, column: 9, scope: !57)
!63 = !DILocation(line: 48, column: 31, scope: !53)
!64 = !DILocation(line: 48, column: 9, scope: !53)
!65 = distinct !{!65, !55, !66, !67}
!66 = !DILocation(line: 51, column: 9, scope: !50)
!67 = !{!"llvm.loop.mustprogress"}
!68 = !DILocation(line: 52, column: 9, scope: !36)
!69 = !DILocation(line: 52, column: 21, scope: !36)
!70 = !DILocation(line: 53, column: 20, scope: !36)
!71 = !DILocation(line: 53, column: 9, scope: !36)
!72 = !DILocation(line: 55, column: 1, scope: !15)
!73 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_04_good", scope: !16, file: !16, line: 120, type: !17, scopeLine: 121, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DILocation(line: 122, column: 5, scope: !73)
!75 = !DILocation(line: 123, column: 5, scope: !73)
!76 = !DILocation(line: 124, column: 1, scope: !73)
!77 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 136, type: !78, scopeLine: 137, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DISubroutineType(types: !79)
!79 = !{!7, !7, !80}
!80 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !81, size: 64)
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !82, size: 64)
!82 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!83 = !DILocalVariable(name: "argc", arg: 1, scope: !77, file: !16, line: 136, type: !7)
!84 = !DILocation(line: 136, column: 14, scope: !77)
!85 = !DILocalVariable(name: "argv", arg: 2, scope: !77, file: !16, line: 136, type: !80)
!86 = !DILocation(line: 136, column: 27, scope: !77)
!87 = !DILocation(line: 139, column: 22, scope: !77)
!88 = !DILocation(line: 139, column: 12, scope: !77)
!89 = !DILocation(line: 139, column: 5, scope: !77)
!90 = !DILocation(line: 141, column: 5, scope: !77)
!91 = !DILocation(line: 142, column: 5, scope: !77)
!92 = !DILocation(line: 143, column: 5, scope: !77)
!93 = !DILocation(line: 146, column: 5, scope: !77)
!94 = !DILocation(line: 147, column: 5, scope: !77)
!95 = !DILocation(line: 148, column: 5, scope: !77)
!96 = !DILocation(line: 150, column: 5, scope: !77)
!97 = distinct !DISubprogram(name: "goodG2B1", scope: !16, file: !16, line: 62, type: !17, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!98 = !DILocalVariable(name: "data", scope: !97, file: !16, line: 64, type: !4)
!99 = !DILocation(line: 64, column: 15, scope: !97)
!100 = !DILocalVariable(name: "dataBadBuffer", scope: !97, file: !16, line: 65, type: !4)
!101 = !DILocation(line: 65, column: 15, scope: !97)
!102 = !DILocation(line: 65, column: 42, scope: !97)
!103 = !DILocation(line: 65, column: 31, scope: !97)
!104 = !DILocalVariable(name: "dataGoodBuffer", scope: !97, file: !16, line: 66, type: !4)
!105 = !DILocation(line: 66, column: 15, scope: !97)
!106 = !DILocation(line: 66, column: 43, scope: !97)
!107 = !DILocation(line: 66, column: 32, scope: !97)
!108 = !DILocation(line: 75, column: 16, scope: !109)
!109 = distinct !DILexicalBlock(scope: !110, file: !16, line: 73, column: 5)
!110 = distinct !DILexicalBlock(scope: !97, file: !16, line: 67, column: 8)
!111 = !DILocation(line: 75, column: 14, scope: !109)
!112 = !DILocation(line: 76, column: 9, scope: !109)
!113 = !DILocation(line: 76, column: 17, scope: !109)
!114 = !DILocalVariable(name: "i", scope: !115, file: !16, line: 79, type: !37)
!115 = distinct !DILexicalBlock(scope: !97, file: !16, line: 78, column: 5)
!116 = !DILocation(line: 79, column: 16, scope: !115)
!117 = !DILocalVariable(name: "source", scope: !115, file: !16, line: 80, type: !41)
!118 = !DILocation(line: 80, column: 17, scope: !115)
!119 = !DILocation(line: 81, column: 17, scope: !115)
!120 = !DILocation(line: 81, column: 9, scope: !115)
!121 = !DILocation(line: 82, column: 9, scope: !115)
!122 = !DILocation(line: 82, column: 23, scope: !115)
!123 = !DILocation(line: 84, column: 16, scope: !124)
!124 = distinct !DILexicalBlock(scope: !115, file: !16, line: 84, column: 9)
!125 = !DILocation(line: 84, column: 14, scope: !124)
!126 = !DILocation(line: 84, column: 21, scope: !127)
!127 = distinct !DILexicalBlock(scope: !124, file: !16, line: 84, column: 9)
!128 = !DILocation(line: 84, column: 23, scope: !127)
!129 = !DILocation(line: 84, column: 9, scope: !124)
!130 = !DILocation(line: 86, column: 30, scope: !131)
!131 = distinct !DILexicalBlock(scope: !127, file: !16, line: 85, column: 9)
!132 = !DILocation(line: 86, column: 23, scope: !131)
!133 = !DILocation(line: 86, column: 13, scope: !131)
!134 = !DILocation(line: 86, column: 18, scope: !131)
!135 = !DILocation(line: 86, column: 21, scope: !131)
!136 = !DILocation(line: 87, column: 9, scope: !131)
!137 = !DILocation(line: 84, column: 31, scope: !127)
!138 = !DILocation(line: 84, column: 9, scope: !127)
!139 = distinct !{!139, !129, !140, !67}
!140 = !DILocation(line: 87, column: 9, scope: !124)
!141 = !DILocation(line: 88, column: 9, scope: !115)
!142 = !DILocation(line: 88, column: 21, scope: !115)
!143 = !DILocation(line: 89, column: 20, scope: !115)
!144 = !DILocation(line: 89, column: 9, scope: !115)
!145 = !DILocation(line: 91, column: 1, scope: !97)
!146 = distinct !DISubprogram(name: "goodG2B2", scope: !16, file: !16, line: 94, type: !17, scopeLine: 95, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!147 = !DILocalVariable(name: "data", scope: !146, file: !16, line: 96, type: !4)
!148 = !DILocation(line: 96, column: 15, scope: !146)
!149 = !DILocalVariable(name: "dataBadBuffer", scope: !146, file: !16, line: 97, type: !4)
!150 = !DILocation(line: 97, column: 15, scope: !146)
!151 = !DILocation(line: 97, column: 42, scope: !146)
!152 = !DILocation(line: 97, column: 31, scope: !146)
!153 = !DILocalVariable(name: "dataGoodBuffer", scope: !146, file: !16, line: 98, type: !4)
!154 = !DILocation(line: 98, column: 15, scope: !146)
!155 = !DILocation(line: 98, column: 43, scope: !146)
!156 = !DILocation(line: 98, column: 32, scope: !146)
!157 = !DILocation(line: 102, column: 16, scope: !158)
!158 = distinct !DILexicalBlock(scope: !159, file: !16, line: 100, column: 5)
!159 = distinct !DILexicalBlock(scope: !146, file: !16, line: 99, column: 8)
!160 = !DILocation(line: 102, column: 14, scope: !158)
!161 = !DILocation(line: 103, column: 9, scope: !158)
!162 = !DILocation(line: 103, column: 17, scope: !158)
!163 = !DILocalVariable(name: "i", scope: !164, file: !16, line: 106, type: !37)
!164 = distinct !DILexicalBlock(scope: !146, file: !16, line: 105, column: 5)
!165 = !DILocation(line: 106, column: 16, scope: !164)
!166 = !DILocalVariable(name: "source", scope: !164, file: !16, line: 107, type: !41)
!167 = !DILocation(line: 107, column: 17, scope: !164)
!168 = !DILocation(line: 108, column: 17, scope: !164)
!169 = !DILocation(line: 108, column: 9, scope: !164)
!170 = !DILocation(line: 109, column: 9, scope: !164)
!171 = !DILocation(line: 109, column: 23, scope: !164)
!172 = !DILocation(line: 111, column: 16, scope: !173)
!173 = distinct !DILexicalBlock(scope: !164, file: !16, line: 111, column: 9)
!174 = !DILocation(line: 111, column: 14, scope: !173)
!175 = !DILocation(line: 111, column: 21, scope: !176)
!176 = distinct !DILexicalBlock(scope: !173, file: !16, line: 111, column: 9)
!177 = !DILocation(line: 111, column: 23, scope: !176)
!178 = !DILocation(line: 111, column: 9, scope: !173)
!179 = !DILocation(line: 113, column: 30, scope: !180)
!180 = distinct !DILexicalBlock(scope: !176, file: !16, line: 112, column: 9)
!181 = !DILocation(line: 113, column: 23, scope: !180)
!182 = !DILocation(line: 113, column: 13, scope: !180)
!183 = !DILocation(line: 113, column: 18, scope: !180)
!184 = !DILocation(line: 113, column: 21, scope: !180)
!185 = !DILocation(line: 114, column: 9, scope: !180)
!186 = !DILocation(line: 111, column: 31, scope: !176)
!187 = !DILocation(line: 111, column: 9, scope: !176)
!188 = distinct !{!188, !178, !189, !67}
!189 = !DILocation(line: 114, column: 9, scope: !173)
!190 = !DILocation(line: 115, column: 9, scope: !164)
!191 = !DILocation(line: 115, column: 21, scope: !164)
!192 = !DILocation(line: 116, column: 20, scope: !164)
!193 = !DILocation(line: 116, column: 9, scope: !164)
!194 = !DILocation(line: 118, column: 1, scope: !146)

; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_44.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.badSink.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.goodG2BSink.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_44_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !21, metadata !DIExpression()), !dbg !25
  store void (i32*)* @badSink, void (i32*)** %funcPtr, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !26, metadata !DIExpression()), !dbg !27
  %0 = alloca i8, i64 40, align 16, !dbg !28
  %1 = bitcast i8* %0 to i32*, !dbg !29
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !30, metadata !DIExpression()), !dbg !31
  %2 = alloca i8, i64 44, align 16, !dbg !32
  %3 = bitcast i8* %2 to i32*, !dbg !33
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !31
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !34
  store i32* %4, i32** %data, align 8, !dbg !35
  %5 = load i32*, i32** %data, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !36
  store i32 0, i32* %arrayidx, align 4, !dbg !37
  %6 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !38
  %7 = load i32*, i32** %data, align 8, !dbg !39
  call void %6(i32* %7), !dbg !38
  ret void, !dbg !40
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i32* %data) #0 !dbg !41 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !42, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !44, metadata !DIExpression()), !dbg !49
  %0 = bitcast [11 x i32]* %source to i8*, !dbg !49
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([11 x i32]* @__const.badSink.source to i8*), i64 44, i1 false), !dbg !49
  call void @llvm.dbg.declare(metadata i64* %i, metadata !50, metadata !DIExpression()), !dbg !53
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !54, metadata !DIExpression()), !dbg !55
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !56
  %call = call i64 @wcslen(i32* %arraydecay) #6, !dbg !57
  store i64 %call, i64* %sourceLen, align 8, !dbg !58
  store i64 0, i64* %i, align 8, !dbg !59
  br label %for.cond, !dbg !61

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !62
  %2 = load i64, i64* %sourceLen, align 8, !dbg !64
  %add = add i64 %2, 1, !dbg !65
  %cmp = icmp ult i64 %1, %add, !dbg !66
  br i1 %cmp, label %for.body, label %for.end, !dbg !67

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !68
  %arrayidx = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %3, !dbg !70
  %4 = load i32, i32* %arrayidx, align 4, !dbg !70
  %5 = load i32*, i32** %data.addr, align 8, !dbg !71
  %6 = load i64, i64* %i, align 8, !dbg !72
  %arrayidx1 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !71
  store i32 %4, i32* %arrayidx1, align 4, !dbg !73
  br label %for.inc, !dbg !74

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !75
  %inc = add i64 %7, 1, !dbg !75
  store i64 %inc, i64* %i, align 8, !dbg !75
  br label %for.cond, !dbg !76, !llvm.loop !77

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %data.addr, align 8, !dbg !80
  call void @printWLine(i32* %8), !dbg !81
  ret void, !dbg !82
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_44_good() #0 !dbg !83 {
entry:
  call void @goodG2B(), !dbg !84
  ret void, !dbg !85
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !86 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !92, metadata !DIExpression()), !dbg !93
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !94, metadata !DIExpression()), !dbg !95
  %call = call i64 @time(i64* null) #7, !dbg !96
  %conv = trunc i64 %call to i32, !dbg !97
  call void @srand(i32 %conv) #7, !dbg !98
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !99
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_44_good(), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !101
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !102
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_44_bad(), !dbg !103
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !104
  ret i32 0, !dbg !105
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #5

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !106 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !107, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !109, metadata !DIExpression()), !dbg !110
  store void (i32*)* @goodG2BSink, void (i32*)** %funcPtr, align 8, !dbg !110
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !111, metadata !DIExpression()), !dbg !112
  %0 = alloca i8, i64 40, align 16, !dbg !113
  %1 = bitcast i8* %0 to i32*, !dbg !114
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !112
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !115, metadata !DIExpression()), !dbg !116
  %2 = alloca i8, i64 44, align 16, !dbg !117
  %3 = bitcast i8* %2 to i32*, !dbg !118
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !116
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !119
  store i32* %4, i32** %data, align 8, !dbg !120
  %5 = load i32*, i32** %data, align 8, !dbg !121
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !121
  store i32 0, i32* %arrayidx, align 4, !dbg !122
  %6 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !123
  %7 = load i32*, i32** %data, align 8, !dbg !124
  call void %6(i32* %7), !dbg !123
  ret void, !dbg !125
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i32* %data) #0 !dbg !126 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !127, metadata !DIExpression()), !dbg !128
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !129, metadata !DIExpression()), !dbg !131
  %0 = bitcast [11 x i32]* %source to i8*, !dbg !131
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([11 x i32]* @__const.goodG2BSink.source to i8*), i64 44, i1 false), !dbg !131
  call void @llvm.dbg.declare(metadata i64* %i, metadata !132, metadata !DIExpression()), !dbg !133
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !134, metadata !DIExpression()), !dbg !135
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !136
  %call = call i64 @wcslen(i32* %arraydecay) #6, !dbg !137
  store i64 %call, i64* %sourceLen, align 8, !dbg !138
  store i64 0, i64* %i, align 8, !dbg !139
  br label %for.cond, !dbg !141

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !142
  %2 = load i64, i64* %sourceLen, align 8, !dbg !144
  %add = add i64 %2, 1, !dbg !145
  %cmp = icmp ult i64 %1, %add, !dbg !146
  br i1 %cmp, label %for.body, label %for.end, !dbg !147

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !148
  %arrayidx = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %3, !dbg !150
  %4 = load i32, i32* %arrayidx, align 4, !dbg !150
  %5 = load i32*, i32** %data.addr, align 8, !dbg !151
  %6 = load i64, i64* %i, align 8, !dbg !152
  %arrayidx1 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !151
  store i32 %4, i32* %arrayidx1, align 4, !dbg !153
  br label %for.inc, !dbg !154

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !155
  %inc = add i64 %7, 1, !dbg !155
  store i64 %inc, i64* %i, align 8, !dbg !155
  br label %for.cond, !dbg !156, !llvm.loop !157

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %data.addr, align 8, !dbg !159
  call void @printWLine(i32* %8), !dbg !160
  ret void, !dbg !161
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_44.c", directory: "/root/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_44_bad", scope: !16, file: !16, line: 44, type: !17, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_44.c", directory: "/root/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 46, type: !4)
!20 = !DILocation(line: 46, column: 15, scope: !15)
!21 = !DILocalVariable(name: "funcPtr", scope: !15, file: !16, line: 48, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = !DISubroutineType(types: !24)
!24 = !{null, !4}
!25 = !DILocation(line: 48, column: 12, scope: !15)
!26 = !DILocalVariable(name: "dataBadBuffer", scope: !15, file: !16, line: 49, type: !4)
!27 = !DILocation(line: 49, column: 15, scope: !15)
!28 = !DILocation(line: 49, column: 42, scope: !15)
!29 = !DILocation(line: 49, column: 31, scope: !15)
!30 = !DILocalVariable(name: "dataGoodBuffer", scope: !15, file: !16, line: 50, type: !4)
!31 = !DILocation(line: 50, column: 15, scope: !15)
!32 = !DILocation(line: 50, column: 43, scope: !15)
!33 = !DILocation(line: 50, column: 32, scope: !15)
!34 = !DILocation(line: 53, column: 12, scope: !15)
!35 = !DILocation(line: 53, column: 10, scope: !15)
!36 = !DILocation(line: 54, column: 5, scope: !15)
!37 = !DILocation(line: 54, column: 13, scope: !15)
!38 = !DILocation(line: 56, column: 5, scope: !15)
!39 = !DILocation(line: 56, column: 13, scope: !15)
!40 = !DILocation(line: 57, column: 1, scope: !15)
!41 = distinct !DISubprogram(name: "badSink", scope: !16, file: !16, line: 28, type: !23, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!42 = !DILocalVariable(name: "data", arg: 1, scope: !41, file: !16, line: 28, type: !4)
!43 = !DILocation(line: 28, column: 31, scope: !41)
!44 = !DILocalVariable(name: "source", scope: !45, file: !16, line: 31, type: !46)
!45 = distinct !DILexicalBlock(scope: !41, file: !16, line: 30, column: 5)
!46 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 352, elements: !47)
!47 = !{!48}
!48 = !DISubrange(count: 11)
!49 = !DILocation(line: 31, column: 17, scope: !45)
!50 = !DILocalVariable(name: "i", scope: !45, file: !16, line: 32, type: !51)
!51 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !52)
!52 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!53 = !DILocation(line: 32, column: 16, scope: !45)
!54 = !DILocalVariable(name: "sourceLen", scope: !45, file: !16, line: 32, type: !51)
!55 = !DILocation(line: 32, column: 19, scope: !45)
!56 = !DILocation(line: 33, column: 28, scope: !45)
!57 = !DILocation(line: 33, column: 21, scope: !45)
!58 = !DILocation(line: 33, column: 19, scope: !45)
!59 = !DILocation(line: 36, column: 16, scope: !60)
!60 = distinct !DILexicalBlock(scope: !45, file: !16, line: 36, column: 9)
!61 = !DILocation(line: 36, column: 14, scope: !60)
!62 = !DILocation(line: 36, column: 21, scope: !63)
!63 = distinct !DILexicalBlock(scope: !60, file: !16, line: 36, column: 9)
!64 = !DILocation(line: 36, column: 25, scope: !63)
!65 = !DILocation(line: 36, column: 35, scope: !63)
!66 = !DILocation(line: 36, column: 23, scope: !63)
!67 = !DILocation(line: 36, column: 9, scope: !60)
!68 = !DILocation(line: 38, column: 30, scope: !69)
!69 = distinct !DILexicalBlock(scope: !63, file: !16, line: 37, column: 9)
!70 = !DILocation(line: 38, column: 23, scope: !69)
!71 = !DILocation(line: 38, column: 13, scope: !69)
!72 = !DILocation(line: 38, column: 18, scope: !69)
!73 = !DILocation(line: 38, column: 21, scope: !69)
!74 = !DILocation(line: 39, column: 9, scope: !69)
!75 = !DILocation(line: 36, column: 41, scope: !63)
!76 = !DILocation(line: 36, column: 9, scope: !63)
!77 = distinct !{!77, !67, !78, !79}
!78 = !DILocation(line: 39, column: 9, scope: !60)
!79 = !{!"llvm.loop.mustprogress"}
!80 = !DILocation(line: 40, column: 20, scope: !45)
!81 = !DILocation(line: 40, column: 9, scope: !45)
!82 = !DILocation(line: 42, column: 1, scope: !41)
!83 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_44_good", scope: !16, file: !16, line: 93, type: !17, scopeLine: 94, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DILocation(line: 95, column: 5, scope: !83)
!85 = !DILocation(line: 96, column: 1, scope: !83)
!86 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 107, type: !87, scopeLine: 108, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!87 = !DISubroutineType(types: !88)
!88 = !{!7, !7, !89}
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !90, size: 64)
!90 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !91, size: 64)
!91 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!92 = !DILocalVariable(name: "argc", arg: 1, scope: !86, file: !16, line: 107, type: !7)
!93 = !DILocation(line: 107, column: 14, scope: !86)
!94 = !DILocalVariable(name: "argv", arg: 2, scope: !86, file: !16, line: 107, type: !89)
!95 = !DILocation(line: 107, column: 27, scope: !86)
!96 = !DILocation(line: 110, column: 22, scope: !86)
!97 = !DILocation(line: 110, column: 12, scope: !86)
!98 = !DILocation(line: 110, column: 5, scope: !86)
!99 = !DILocation(line: 112, column: 5, scope: !86)
!100 = !DILocation(line: 113, column: 5, scope: !86)
!101 = !DILocation(line: 114, column: 5, scope: !86)
!102 = !DILocation(line: 117, column: 5, scope: !86)
!103 = !DILocation(line: 118, column: 5, scope: !86)
!104 = !DILocation(line: 119, column: 5, scope: !86)
!105 = !DILocation(line: 121, column: 5, scope: !86)
!106 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 80, type: !17, scopeLine: 81, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!107 = !DILocalVariable(name: "data", scope: !106, file: !16, line: 82, type: !4)
!108 = !DILocation(line: 82, column: 15, scope: !106)
!109 = !DILocalVariable(name: "funcPtr", scope: !106, file: !16, line: 83, type: !22)
!110 = !DILocation(line: 83, column: 12, scope: !106)
!111 = !DILocalVariable(name: "dataBadBuffer", scope: !106, file: !16, line: 84, type: !4)
!112 = !DILocation(line: 84, column: 15, scope: !106)
!113 = !DILocation(line: 84, column: 42, scope: !106)
!114 = !DILocation(line: 84, column: 31, scope: !106)
!115 = !DILocalVariable(name: "dataGoodBuffer", scope: !106, file: !16, line: 85, type: !4)
!116 = !DILocation(line: 85, column: 15, scope: !106)
!117 = !DILocation(line: 85, column: 43, scope: !106)
!118 = !DILocation(line: 85, column: 32, scope: !106)
!119 = !DILocation(line: 88, column: 12, scope: !106)
!120 = !DILocation(line: 88, column: 10, scope: !106)
!121 = !DILocation(line: 89, column: 5, scope: !106)
!122 = !DILocation(line: 89, column: 13, scope: !106)
!123 = !DILocation(line: 90, column: 5, scope: !106)
!124 = !DILocation(line: 90, column: 13, scope: !106)
!125 = !DILocation(line: 91, column: 1, scope: !106)
!126 = distinct !DISubprogram(name: "goodG2BSink", scope: !16, file: !16, line: 64, type: !23, scopeLine: 65, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!127 = !DILocalVariable(name: "data", arg: 1, scope: !126, file: !16, line: 64, type: !4)
!128 = !DILocation(line: 64, column: 35, scope: !126)
!129 = !DILocalVariable(name: "source", scope: !130, file: !16, line: 67, type: !46)
!130 = distinct !DILexicalBlock(scope: !126, file: !16, line: 66, column: 5)
!131 = !DILocation(line: 67, column: 17, scope: !130)
!132 = !DILocalVariable(name: "i", scope: !130, file: !16, line: 68, type: !51)
!133 = !DILocation(line: 68, column: 16, scope: !130)
!134 = !DILocalVariable(name: "sourceLen", scope: !130, file: !16, line: 68, type: !51)
!135 = !DILocation(line: 68, column: 19, scope: !130)
!136 = !DILocation(line: 69, column: 28, scope: !130)
!137 = !DILocation(line: 69, column: 21, scope: !130)
!138 = !DILocation(line: 69, column: 19, scope: !130)
!139 = !DILocation(line: 72, column: 16, scope: !140)
!140 = distinct !DILexicalBlock(scope: !130, file: !16, line: 72, column: 9)
!141 = !DILocation(line: 72, column: 14, scope: !140)
!142 = !DILocation(line: 72, column: 21, scope: !143)
!143 = distinct !DILexicalBlock(scope: !140, file: !16, line: 72, column: 9)
!144 = !DILocation(line: 72, column: 25, scope: !143)
!145 = !DILocation(line: 72, column: 35, scope: !143)
!146 = !DILocation(line: 72, column: 23, scope: !143)
!147 = !DILocation(line: 72, column: 9, scope: !140)
!148 = !DILocation(line: 74, column: 30, scope: !149)
!149 = distinct !DILexicalBlock(scope: !143, file: !16, line: 73, column: 9)
!150 = !DILocation(line: 74, column: 23, scope: !149)
!151 = !DILocation(line: 74, column: 13, scope: !149)
!152 = !DILocation(line: 74, column: 18, scope: !149)
!153 = !DILocation(line: 74, column: 21, scope: !149)
!154 = !DILocation(line: 75, column: 9, scope: !149)
!155 = !DILocation(line: 72, column: 41, scope: !143)
!156 = !DILocation(line: 72, column: 9, scope: !143)
!157 = distinct !{!157, !147, !158, !79}
!158 = !DILocation(line: 75, column: 9, scope: !140)
!159 = !DILocation(line: 76, column: 20, scope: !130)
!160 = !DILocation(line: 76, column: 9, scope: !130)
!161 = !DILocation(line: 78, column: 1, scope: !126)

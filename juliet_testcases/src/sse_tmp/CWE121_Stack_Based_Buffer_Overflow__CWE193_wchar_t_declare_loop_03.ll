; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_03.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_03.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_03_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.goodG2B2.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_03_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !31
  store i32* %arraydecay, i32** %data, align 8, !dbg !34
  %0 = load i32*, i32** %data, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !35
  store i32 0, i32* %arrayidx, align 4, !dbg !36
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !37, metadata !DIExpression()), !dbg !39
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !39
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_03_bad.source to i8*), i64 44, i1 false), !dbg !39
  call void @llvm.dbg.declare(metadata i64* %i, metadata !40, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !44, metadata !DIExpression()), !dbg !45
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !46
  %call = call i64 @wcslen(i32* %arraydecay1) #6, !dbg !47
  store i64 %call, i64* %sourceLen, align 8, !dbg !48
  store i64 0, i64* %i, align 8, !dbg !49
  br label %for.cond, !dbg !51

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !52
  %3 = load i64, i64* %sourceLen, align 8, !dbg !54
  %add = add i64 %3, 1, !dbg !55
  %cmp = icmp ult i64 %2, %add, !dbg !56
  br i1 %cmp, label %for.body, label %for.end, !dbg !57

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !58
  %arrayidx2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %4, !dbg !60
  %5 = load i32, i32* %arrayidx2, align 4, !dbg !60
  %6 = load i32*, i32** %data, align 8, !dbg !61
  %7 = load i64, i64* %i, align 8, !dbg !62
  %arrayidx3 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !61
  store i32 %5, i32* %arrayidx3, align 4, !dbg !63
  br label %for.inc, !dbg !64

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !65
  %inc = add i64 %8, 1, !dbg !65
  store i64 %inc, i64* %i, align 8, !dbg !65
  br label %for.cond, !dbg !66, !llvm.loop !67

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !70
  call void @printWLine(i32* %9), !dbg !71
  ret void, !dbg !72
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_03_good() #0 !dbg !73 {
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
  %call = call i64 @time(i64* null) #7, !dbg !87
  %conv = trunc i64 %call to i32, !dbg !88
  call void @srand(i32 %conv) #7, !dbg !89
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !90
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_03_good(), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !93
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_03_bad(), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !95
  ret i32 0, !dbg !96
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !97 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !98, metadata !DIExpression()), !dbg !99
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !100, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !102, metadata !DIExpression()), !dbg !103
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !104
  store i32* %arraydecay, i32** %data, align 8, !dbg !107
  %0 = load i32*, i32** %data, align 8, !dbg !108
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !108
  store i32 0, i32* %arrayidx, align 4, !dbg !109
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !110, metadata !DIExpression()), !dbg !112
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !112
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B1.source to i8*), i64 44, i1 false), !dbg !112
  call void @llvm.dbg.declare(metadata i64* %i, metadata !113, metadata !DIExpression()), !dbg !114
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !115, metadata !DIExpression()), !dbg !116
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !117
  %call = call i64 @wcslen(i32* %arraydecay1) #6, !dbg !118
  store i64 %call, i64* %sourceLen, align 8, !dbg !119
  store i64 0, i64* %i, align 8, !dbg !120
  br label %for.cond, !dbg !122

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !123
  %3 = load i64, i64* %sourceLen, align 8, !dbg !125
  %add = add i64 %3, 1, !dbg !126
  %cmp = icmp ult i64 %2, %add, !dbg !127
  br i1 %cmp, label %for.body, label %for.end, !dbg !128

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !129
  %arrayidx2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %4, !dbg !131
  %5 = load i32, i32* %arrayidx2, align 4, !dbg !131
  %6 = load i32*, i32** %data, align 8, !dbg !132
  %7 = load i64, i64* %i, align 8, !dbg !133
  %arrayidx3 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !132
  store i32 %5, i32* %arrayidx3, align 4, !dbg !134
  br label %for.inc, !dbg !135

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !136
  %inc = add i64 %8, 1, !dbg !136
  store i64 %inc, i64* %i, align 8, !dbg !136
  br label %for.cond, !dbg !137, !llvm.loop !138

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !140
  call void @printWLine(i32* %9), !dbg !141
  ret void, !dbg !142
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !143 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !144, metadata !DIExpression()), !dbg !145
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !146, metadata !DIExpression()), !dbg !147
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !148, metadata !DIExpression()), !dbg !149
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !150
  store i32* %arraydecay, i32** %data, align 8, !dbg !153
  %0 = load i32*, i32** %data, align 8, !dbg !154
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !154
  store i32 0, i32* %arrayidx, align 4, !dbg !155
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !156, metadata !DIExpression()), !dbg !158
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !158
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B2.source to i8*), i64 44, i1 false), !dbg !158
  call void @llvm.dbg.declare(metadata i64* %i, metadata !159, metadata !DIExpression()), !dbg !160
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !161, metadata !DIExpression()), !dbg !162
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !163
  %call = call i64 @wcslen(i32* %arraydecay1) #6, !dbg !164
  store i64 %call, i64* %sourceLen, align 8, !dbg !165
  store i64 0, i64* %i, align 8, !dbg !166
  br label %for.cond, !dbg !168

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !169
  %3 = load i64, i64* %sourceLen, align 8, !dbg !171
  %add = add i64 %3, 1, !dbg !172
  %cmp = icmp ult i64 %2, %add, !dbg !173
  br i1 %cmp, label %for.body, label %for.end, !dbg !174

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !175
  %arrayidx2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %4, !dbg !177
  %5 = load i32, i32* %arrayidx2, align 4, !dbg !177
  %6 = load i32*, i32** %data, align 8, !dbg !178
  %7 = load i64, i64* %i, align 8, !dbg !179
  %arrayidx3 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !178
  store i32 %5, i32* %arrayidx3, align 4, !dbg !180
  br label %for.inc, !dbg !181

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !182
  %inc = add i64 %8, 1, !dbg !182
  store i64 %inc, i64* %i, align 8, !dbg !182
  br label %for.cond, !dbg !183, !llvm.loop !184

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !186
  call void @printWLine(i32* %9), !dbg !187
  ret void, !dbg !188
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_03.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_03_bad", scope: !12, file: !12, line: 28, type: !13, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_03.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 30, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 30, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 31, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 320, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 10)
!25 = !DILocation(line: 31, column: 13, scope: !11)
!26 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 32, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 352, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 11)
!30 = !DILocation(line: 32, column: 13, scope: !11)
!31 = !DILocation(line: 37, column: 16, scope: !32)
!32 = distinct !DILexicalBlock(scope: !33, file: !12, line: 34, column: 5)
!33 = distinct !DILexicalBlock(scope: !11, file: !12, line: 33, column: 8)
!34 = !DILocation(line: 37, column: 14, scope: !32)
!35 = !DILocation(line: 38, column: 9, scope: !32)
!36 = !DILocation(line: 38, column: 17, scope: !32)
!37 = !DILocalVariable(name: "source", scope: !38, file: !12, line: 41, type: !27)
!38 = distinct !DILexicalBlock(scope: !11, file: !12, line: 40, column: 5)
!39 = !DILocation(line: 41, column: 17, scope: !38)
!40 = !DILocalVariable(name: "i", scope: !38, file: !12, line: 42, type: !41)
!41 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !18, line: 46, baseType: !42)
!42 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!43 = !DILocation(line: 42, column: 16, scope: !38)
!44 = !DILocalVariable(name: "sourceLen", scope: !38, file: !12, line: 42, type: !41)
!45 = !DILocation(line: 42, column: 19, scope: !38)
!46 = !DILocation(line: 43, column: 28, scope: !38)
!47 = !DILocation(line: 43, column: 21, scope: !38)
!48 = !DILocation(line: 43, column: 19, scope: !38)
!49 = !DILocation(line: 46, column: 16, scope: !50)
!50 = distinct !DILexicalBlock(scope: !38, file: !12, line: 46, column: 9)
!51 = !DILocation(line: 46, column: 14, scope: !50)
!52 = !DILocation(line: 46, column: 21, scope: !53)
!53 = distinct !DILexicalBlock(scope: !50, file: !12, line: 46, column: 9)
!54 = !DILocation(line: 46, column: 25, scope: !53)
!55 = !DILocation(line: 46, column: 35, scope: !53)
!56 = !DILocation(line: 46, column: 23, scope: !53)
!57 = !DILocation(line: 46, column: 9, scope: !50)
!58 = !DILocation(line: 48, column: 30, scope: !59)
!59 = distinct !DILexicalBlock(scope: !53, file: !12, line: 47, column: 9)
!60 = !DILocation(line: 48, column: 23, scope: !59)
!61 = !DILocation(line: 48, column: 13, scope: !59)
!62 = !DILocation(line: 48, column: 18, scope: !59)
!63 = !DILocation(line: 48, column: 21, scope: !59)
!64 = !DILocation(line: 49, column: 9, scope: !59)
!65 = !DILocation(line: 46, column: 41, scope: !53)
!66 = !DILocation(line: 46, column: 9, scope: !53)
!67 = distinct !{!67, !57, !68, !69}
!68 = !DILocation(line: 49, column: 9, scope: !50)
!69 = !{!"llvm.loop.mustprogress"}
!70 = !DILocation(line: 50, column: 20, scope: !38)
!71 = !DILocation(line: 50, column: 9, scope: !38)
!72 = !DILocation(line: 52, column: 1, scope: !11)
!73 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_03_good", scope: !12, file: !12, line: 117, type: !13, scopeLine: 118, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DILocation(line: 119, column: 5, scope: !73)
!75 = !DILocation(line: 120, column: 5, scope: !73)
!76 = !DILocation(line: 121, column: 1, scope: !73)
!77 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 133, type: !78, scopeLine: 134, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DISubroutineType(types: !79)
!79 = !{!19, !19, !80}
!80 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !81, size: 64)
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !82, size: 64)
!82 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!83 = !DILocalVariable(name: "argc", arg: 1, scope: !77, file: !12, line: 133, type: !19)
!84 = !DILocation(line: 133, column: 14, scope: !77)
!85 = !DILocalVariable(name: "argv", arg: 2, scope: !77, file: !12, line: 133, type: !80)
!86 = !DILocation(line: 133, column: 27, scope: !77)
!87 = !DILocation(line: 136, column: 22, scope: !77)
!88 = !DILocation(line: 136, column: 12, scope: !77)
!89 = !DILocation(line: 136, column: 5, scope: !77)
!90 = !DILocation(line: 138, column: 5, scope: !77)
!91 = !DILocation(line: 139, column: 5, scope: !77)
!92 = !DILocation(line: 140, column: 5, scope: !77)
!93 = !DILocation(line: 143, column: 5, scope: !77)
!94 = !DILocation(line: 144, column: 5, scope: !77)
!95 = !DILocation(line: 145, column: 5, scope: !77)
!96 = !DILocation(line: 147, column: 5, scope: !77)
!97 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 59, type: !13, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!98 = !DILocalVariable(name: "data", scope: !97, file: !12, line: 61, type: !16)
!99 = !DILocation(line: 61, column: 15, scope: !97)
!100 = !DILocalVariable(name: "dataBadBuffer", scope: !97, file: !12, line: 62, type: !22)
!101 = !DILocation(line: 62, column: 13, scope: !97)
!102 = !DILocalVariable(name: "dataGoodBuffer", scope: !97, file: !12, line: 63, type: !27)
!103 = !DILocation(line: 63, column: 13, scope: !97)
!104 = !DILocation(line: 73, column: 16, scope: !105)
!105 = distinct !DILexicalBlock(scope: !106, file: !12, line: 70, column: 5)
!106 = distinct !DILexicalBlock(scope: !97, file: !12, line: 64, column: 8)
!107 = !DILocation(line: 73, column: 14, scope: !105)
!108 = !DILocation(line: 74, column: 9, scope: !105)
!109 = !DILocation(line: 74, column: 17, scope: !105)
!110 = !DILocalVariable(name: "source", scope: !111, file: !12, line: 77, type: !27)
!111 = distinct !DILexicalBlock(scope: !97, file: !12, line: 76, column: 5)
!112 = !DILocation(line: 77, column: 17, scope: !111)
!113 = !DILocalVariable(name: "i", scope: !111, file: !12, line: 78, type: !41)
!114 = !DILocation(line: 78, column: 16, scope: !111)
!115 = !DILocalVariable(name: "sourceLen", scope: !111, file: !12, line: 78, type: !41)
!116 = !DILocation(line: 78, column: 19, scope: !111)
!117 = !DILocation(line: 79, column: 28, scope: !111)
!118 = !DILocation(line: 79, column: 21, scope: !111)
!119 = !DILocation(line: 79, column: 19, scope: !111)
!120 = !DILocation(line: 82, column: 16, scope: !121)
!121 = distinct !DILexicalBlock(scope: !111, file: !12, line: 82, column: 9)
!122 = !DILocation(line: 82, column: 14, scope: !121)
!123 = !DILocation(line: 82, column: 21, scope: !124)
!124 = distinct !DILexicalBlock(scope: !121, file: !12, line: 82, column: 9)
!125 = !DILocation(line: 82, column: 25, scope: !124)
!126 = !DILocation(line: 82, column: 35, scope: !124)
!127 = !DILocation(line: 82, column: 23, scope: !124)
!128 = !DILocation(line: 82, column: 9, scope: !121)
!129 = !DILocation(line: 84, column: 30, scope: !130)
!130 = distinct !DILexicalBlock(scope: !124, file: !12, line: 83, column: 9)
!131 = !DILocation(line: 84, column: 23, scope: !130)
!132 = !DILocation(line: 84, column: 13, scope: !130)
!133 = !DILocation(line: 84, column: 18, scope: !130)
!134 = !DILocation(line: 84, column: 21, scope: !130)
!135 = !DILocation(line: 85, column: 9, scope: !130)
!136 = !DILocation(line: 82, column: 41, scope: !124)
!137 = !DILocation(line: 82, column: 9, scope: !124)
!138 = distinct !{!138, !128, !139, !69}
!139 = !DILocation(line: 85, column: 9, scope: !121)
!140 = !DILocation(line: 86, column: 20, scope: !111)
!141 = !DILocation(line: 86, column: 9, scope: !111)
!142 = !DILocation(line: 88, column: 1, scope: !97)
!143 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 91, type: !13, scopeLine: 92, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!144 = !DILocalVariable(name: "data", scope: !143, file: !12, line: 93, type: !16)
!145 = !DILocation(line: 93, column: 15, scope: !143)
!146 = !DILocalVariable(name: "dataBadBuffer", scope: !143, file: !12, line: 94, type: !22)
!147 = !DILocation(line: 94, column: 13, scope: !143)
!148 = !DILocalVariable(name: "dataGoodBuffer", scope: !143, file: !12, line: 95, type: !27)
!149 = !DILocation(line: 95, column: 13, scope: !143)
!150 = !DILocation(line: 100, column: 16, scope: !151)
!151 = distinct !DILexicalBlock(scope: !152, file: !12, line: 97, column: 5)
!152 = distinct !DILexicalBlock(scope: !143, file: !12, line: 96, column: 8)
!153 = !DILocation(line: 100, column: 14, scope: !151)
!154 = !DILocation(line: 101, column: 9, scope: !151)
!155 = !DILocation(line: 101, column: 17, scope: !151)
!156 = !DILocalVariable(name: "source", scope: !157, file: !12, line: 104, type: !27)
!157 = distinct !DILexicalBlock(scope: !143, file: !12, line: 103, column: 5)
!158 = !DILocation(line: 104, column: 17, scope: !157)
!159 = !DILocalVariable(name: "i", scope: !157, file: !12, line: 105, type: !41)
!160 = !DILocation(line: 105, column: 16, scope: !157)
!161 = !DILocalVariable(name: "sourceLen", scope: !157, file: !12, line: 105, type: !41)
!162 = !DILocation(line: 105, column: 19, scope: !157)
!163 = !DILocation(line: 106, column: 28, scope: !157)
!164 = !DILocation(line: 106, column: 21, scope: !157)
!165 = !DILocation(line: 106, column: 19, scope: !157)
!166 = !DILocation(line: 109, column: 16, scope: !167)
!167 = distinct !DILexicalBlock(scope: !157, file: !12, line: 109, column: 9)
!168 = !DILocation(line: 109, column: 14, scope: !167)
!169 = !DILocation(line: 109, column: 21, scope: !170)
!170 = distinct !DILexicalBlock(scope: !167, file: !12, line: 109, column: 9)
!171 = !DILocation(line: 109, column: 25, scope: !170)
!172 = !DILocation(line: 109, column: 35, scope: !170)
!173 = !DILocation(line: 109, column: 23, scope: !170)
!174 = !DILocation(line: 109, column: 9, scope: !167)
!175 = !DILocation(line: 111, column: 30, scope: !176)
!176 = distinct !DILexicalBlock(scope: !170, file: !12, line: 110, column: 9)
!177 = !DILocation(line: 111, column: 23, scope: !176)
!178 = !DILocation(line: 111, column: 13, scope: !176)
!179 = !DILocation(line: 111, column: 18, scope: !176)
!180 = !DILocation(line: 111, column: 21, scope: !176)
!181 = !DILocation(line: 112, column: 9, scope: !176)
!182 = !DILocation(line: 109, column: 41, scope: !170)
!183 = !DILocation(line: 109, column: 9, scope: !170)
!184 = distinct !{!184, !174, !185, !69}
!185 = !DILocation(line: 112, column: 9, scope: !167)
!186 = !DILocation(line: 113, column: 20, scope: !157)
!187 = !DILocation(line: 113, column: 9, scope: !157)
!188 = !DILocation(line: 115, column: 1, scope: !143)

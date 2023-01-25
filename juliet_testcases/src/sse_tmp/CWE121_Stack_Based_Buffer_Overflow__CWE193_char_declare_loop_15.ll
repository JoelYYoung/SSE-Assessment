; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_15.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_15_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.goodG2B2.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_15_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  %arraydecay = getelementptr inbounds [10 x i8], [10 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !29
  store i8* %arraydecay, i8** %data, align 8, !dbg !30
  %0 = load i8*, i8** %data, align 8, !dbg !31
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !31
  store i8 0, i8* %arrayidx, align 1, !dbg !32
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !33, metadata !DIExpression()), !dbg !35
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !35
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_15_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !35
  call void @llvm.dbg.declare(metadata i64* %i, metadata !36, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !41, metadata !DIExpression()), !dbg !42
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !43
  %call = call i64 @strlen(i8* %arraydecay1) #6, !dbg !44
  store i64 %call, i64* %sourceLen, align 8, !dbg !45
  store i64 0, i64* %i, align 8, !dbg !46
  br label %for.cond, !dbg !48

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !49
  %3 = load i64, i64* %sourceLen, align 8, !dbg !51
  %add = add i64 %3, 1, !dbg !52
  %cmp = icmp ult i64 %2, %add, !dbg !53
  br i1 %cmp, label %for.body, label %for.end, !dbg !54

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !55
  %arrayidx2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %4, !dbg !57
  %5 = load i8, i8* %arrayidx2, align 1, !dbg !57
  %6 = load i8*, i8** %data, align 8, !dbg !58
  %7 = load i64, i64* %i, align 8, !dbg !59
  %arrayidx3 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !58
  store i8 %5, i8* %arrayidx3, align 1, !dbg !60
  br label %for.inc, !dbg !61

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !62
  %inc = add i64 %8, 1, !dbg !62
  store i64 %inc, i64* %i, align 8, !dbg !62
  br label %for.cond, !dbg !63, !llvm.loop !64

for.end:                                          ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !67
  call void @printLine(i8* %9), !dbg !68
  ret void, !dbg !69
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_15_good() #0 !dbg !70 {
entry:
  call void @goodG2B1(), !dbg !71
  call void @goodG2B2(), !dbg !72
  ret void, !dbg !73
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !74 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !79, metadata !DIExpression()), !dbg !80
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !81, metadata !DIExpression()), !dbg !82
  %call = call i64 @time(i64* null) #7, !dbg !83
  %conv = trunc i64 %call to i32, !dbg !84
  call void @srand(i32 %conv) #7, !dbg !85
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !86
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_15_good(), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !89
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_15_bad(), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !91
  ret i32 0, !dbg !92
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !93 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !94, metadata !DIExpression()), !dbg !95
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !96, metadata !DIExpression()), !dbg !97
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !98, metadata !DIExpression()), !dbg !99
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !100
  store i8* %arraydecay, i8** %data, align 8, !dbg !101
  %0 = load i8*, i8** %data, align 8, !dbg !102
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !102
  store i8 0, i8* %arrayidx, align 1, !dbg !103
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !104, metadata !DIExpression()), !dbg !106
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !106
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B1.source, i32 0, i32 0), i64 11, i1 false), !dbg !106
  call void @llvm.dbg.declare(metadata i64* %i, metadata !107, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !109, metadata !DIExpression()), !dbg !110
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !111
  %call = call i64 @strlen(i8* %arraydecay1) #6, !dbg !112
  store i64 %call, i64* %sourceLen, align 8, !dbg !113
  store i64 0, i64* %i, align 8, !dbg !114
  br label %for.cond, !dbg !116

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !117
  %3 = load i64, i64* %sourceLen, align 8, !dbg !119
  %add = add i64 %3, 1, !dbg !120
  %cmp = icmp ult i64 %2, %add, !dbg !121
  br i1 %cmp, label %for.body, label %for.end, !dbg !122

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !123
  %arrayidx2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %4, !dbg !125
  %5 = load i8, i8* %arrayidx2, align 1, !dbg !125
  %6 = load i8*, i8** %data, align 8, !dbg !126
  %7 = load i64, i64* %i, align 8, !dbg !127
  %arrayidx3 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !126
  store i8 %5, i8* %arrayidx3, align 1, !dbg !128
  br label %for.inc, !dbg !129

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !130
  %inc = add i64 %8, 1, !dbg !130
  store i64 %inc, i64* %i, align 8, !dbg !130
  br label %for.cond, !dbg !131, !llvm.loop !132

for.end:                                          ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !134
  call void @printLine(i8* %9), !dbg !135
  ret void, !dbg !136
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !137 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !138, metadata !DIExpression()), !dbg !139
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !140, metadata !DIExpression()), !dbg !141
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !142, metadata !DIExpression()), !dbg !143
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !144
  store i8* %arraydecay, i8** %data, align 8, !dbg !145
  %0 = load i8*, i8** %data, align 8, !dbg !146
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !146
  store i8 0, i8* %arrayidx, align 1, !dbg !147
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !148, metadata !DIExpression()), !dbg !150
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !150
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B2.source, i32 0, i32 0), i64 11, i1 false), !dbg !150
  call void @llvm.dbg.declare(metadata i64* %i, metadata !151, metadata !DIExpression()), !dbg !152
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !153, metadata !DIExpression()), !dbg !154
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !155
  %call = call i64 @strlen(i8* %arraydecay1) #6, !dbg !156
  store i64 %call, i64* %sourceLen, align 8, !dbg !157
  store i64 0, i64* %i, align 8, !dbg !158
  br label %for.cond, !dbg !160

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !161
  %3 = load i64, i64* %sourceLen, align 8, !dbg !163
  %add = add i64 %3, 1, !dbg !164
  %cmp = icmp ult i64 %2, %add, !dbg !165
  br i1 %cmp, label %for.body, label %for.end, !dbg !166

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !167
  %arrayidx2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %4, !dbg !169
  %5 = load i8, i8* %arrayidx2, align 1, !dbg !169
  %6 = load i8*, i8** %data, align 8, !dbg !170
  %7 = load i64, i64* %i, align 8, !dbg !171
  %arrayidx3 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !170
  store i8 %5, i8* %arrayidx3, align 1, !dbg !172
  br label %for.inc, !dbg !173

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !174
  %inc = add i64 %8, 1, !dbg !174
  store i64 %inc, i64* %i, align 8, !dbg !174
  br label %for.cond, !dbg !175, !llvm.loop !176

for.end:                                          ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !178
  call void @printLine(i8* %9), !dbg !179
  ret void, !dbg !180
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_15.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_15_bad", scope: !12, file: !12, line: 28, type: !13, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_15.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 30, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 30, column: 12, scope: !11)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 31, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 80, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 10)
!23 = !DILocation(line: 31, column: 10, scope: !11)
!24 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 32, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 88, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 11)
!28 = !DILocation(line: 32, column: 10, scope: !11)
!29 = !DILocation(line: 38, column: 16, scope: !11)
!30 = !DILocation(line: 38, column: 14, scope: !11)
!31 = !DILocation(line: 39, column: 9, scope: !11)
!32 = !DILocation(line: 39, column: 17, scope: !11)
!33 = !DILocalVariable(name: "source", scope: !34, file: !12, line: 47, type: !25)
!34 = distinct !DILexicalBlock(scope: !11, file: !12, line: 46, column: 5)
!35 = !DILocation(line: 47, column: 14, scope: !34)
!36 = !DILocalVariable(name: "i", scope: !34, file: !12, line: 48, type: !37)
!37 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !38, line: 46, baseType: !39)
!38 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!39 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!40 = !DILocation(line: 48, column: 16, scope: !34)
!41 = !DILocalVariable(name: "sourceLen", scope: !34, file: !12, line: 48, type: !37)
!42 = !DILocation(line: 48, column: 19, scope: !34)
!43 = !DILocation(line: 49, column: 28, scope: !34)
!44 = !DILocation(line: 49, column: 21, scope: !34)
!45 = !DILocation(line: 49, column: 19, scope: !34)
!46 = !DILocation(line: 52, column: 16, scope: !47)
!47 = distinct !DILexicalBlock(scope: !34, file: !12, line: 52, column: 9)
!48 = !DILocation(line: 52, column: 14, scope: !47)
!49 = !DILocation(line: 52, column: 21, scope: !50)
!50 = distinct !DILexicalBlock(scope: !47, file: !12, line: 52, column: 9)
!51 = !DILocation(line: 52, column: 25, scope: !50)
!52 = !DILocation(line: 52, column: 35, scope: !50)
!53 = !DILocation(line: 52, column: 23, scope: !50)
!54 = !DILocation(line: 52, column: 9, scope: !47)
!55 = !DILocation(line: 54, column: 30, scope: !56)
!56 = distinct !DILexicalBlock(scope: !50, file: !12, line: 53, column: 9)
!57 = !DILocation(line: 54, column: 23, scope: !56)
!58 = !DILocation(line: 54, column: 13, scope: !56)
!59 = !DILocation(line: 54, column: 18, scope: !56)
!60 = !DILocation(line: 54, column: 21, scope: !56)
!61 = !DILocation(line: 55, column: 9, scope: !56)
!62 = !DILocation(line: 52, column: 41, scope: !50)
!63 = !DILocation(line: 52, column: 9, scope: !50)
!64 = distinct !{!64, !54, !65, !66}
!65 = !DILocation(line: 55, column: 9, scope: !47)
!66 = !{!"llvm.loop.mustprogress"}
!67 = !DILocation(line: 56, column: 19, scope: !34)
!68 = !DILocation(line: 56, column: 9, scope: !34)
!69 = !DILocation(line: 58, column: 1, scope: !11)
!70 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_15_good", scope: !12, file: !12, line: 130, type: !13, scopeLine: 131, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DILocation(line: 132, column: 5, scope: !70)
!72 = !DILocation(line: 133, column: 5, scope: !70)
!73 = !DILocation(line: 134, column: 1, scope: !70)
!74 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 146, type: !75, scopeLine: 147, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DISubroutineType(types: !76)
!76 = !{!77, !77, !78}
!77 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!78 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!79 = !DILocalVariable(name: "argc", arg: 1, scope: !74, file: !12, line: 146, type: !77)
!80 = !DILocation(line: 146, column: 14, scope: !74)
!81 = !DILocalVariable(name: "argv", arg: 2, scope: !74, file: !12, line: 146, type: !78)
!82 = !DILocation(line: 146, column: 27, scope: !74)
!83 = !DILocation(line: 149, column: 22, scope: !74)
!84 = !DILocation(line: 149, column: 12, scope: !74)
!85 = !DILocation(line: 149, column: 5, scope: !74)
!86 = !DILocation(line: 151, column: 5, scope: !74)
!87 = !DILocation(line: 152, column: 5, scope: !74)
!88 = !DILocation(line: 153, column: 5, scope: !74)
!89 = !DILocation(line: 156, column: 5, scope: !74)
!90 = !DILocation(line: 157, column: 5, scope: !74)
!91 = !DILocation(line: 158, column: 5, scope: !74)
!92 = !DILocation(line: 160, column: 5, scope: !74)
!93 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 65, type: !13, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!94 = !DILocalVariable(name: "data", scope: !93, file: !12, line: 67, type: !16)
!95 = !DILocation(line: 67, column: 12, scope: !93)
!96 = !DILocalVariable(name: "dataBadBuffer", scope: !93, file: !12, line: 68, type: !20)
!97 = !DILocation(line: 68, column: 10, scope: !93)
!98 = !DILocalVariable(name: "dataGoodBuffer", scope: !93, file: !12, line: 69, type: !25)
!99 = !DILocation(line: 69, column: 10, scope: !93)
!100 = !DILocation(line: 79, column: 16, scope: !93)
!101 = !DILocation(line: 79, column: 14, scope: !93)
!102 = !DILocation(line: 80, column: 9, scope: !93)
!103 = !DILocation(line: 80, column: 17, scope: !93)
!104 = !DILocalVariable(name: "source", scope: !105, file: !12, line: 84, type: !25)
!105 = distinct !DILexicalBlock(scope: !93, file: !12, line: 83, column: 5)
!106 = !DILocation(line: 84, column: 14, scope: !105)
!107 = !DILocalVariable(name: "i", scope: !105, file: !12, line: 85, type: !37)
!108 = !DILocation(line: 85, column: 16, scope: !105)
!109 = !DILocalVariable(name: "sourceLen", scope: !105, file: !12, line: 85, type: !37)
!110 = !DILocation(line: 85, column: 19, scope: !105)
!111 = !DILocation(line: 86, column: 28, scope: !105)
!112 = !DILocation(line: 86, column: 21, scope: !105)
!113 = !DILocation(line: 86, column: 19, scope: !105)
!114 = !DILocation(line: 89, column: 16, scope: !115)
!115 = distinct !DILexicalBlock(scope: !105, file: !12, line: 89, column: 9)
!116 = !DILocation(line: 89, column: 14, scope: !115)
!117 = !DILocation(line: 89, column: 21, scope: !118)
!118 = distinct !DILexicalBlock(scope: !115, file: !12, line: 89, column: 9)
!119 = !DILocation(line: 89, column: 25, scope: !118)
!120 = !DILocation(line: 89, column: 35, scope: !118)
!121 = !DILocation(line: 89, column: 23, scope: !118)
!122 = !DILocation(line: 89, column: 9, scope: !115)
!123 = !DILocation(line: 91, column: 30, scope: !124)
!124 = distinct !DILexicalBlock(scope: !118, file: !12, line: 90, column: 9)
!125 = !DILocation(line: 91, column: 23, scope: !124)
!126 = !DILocation(line: 91, column: 13, scope: !124)
!127 = !DILocation(line: 91, column: 18, scope: !124)
!128 = !DILocation(line: 91, column: 21, scope: !124)
!129 = !DILocation(line: 92, column: 9, scope: !124)
!130 = !DILocation(line: 89, column: 41, scope: !118)
!131 = !DILocation(line: 89, column: 9, scope: !118)
!132 = distinct !{!132, !122, !133, !66}
!133 = !DILocation(line: 92, column: 9, scope: !115)
!134 = !DILocation(line: 93, column: 19, scope: !105)
!135 = !DILocation(line: 93, column: 9, scope: !105)
!136 = !DILocation(line: 95, column: 1, scope: !93)
!137 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 98, type: !13, scopeLine: 99, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!138 = !DILocalVariable(name: "data", scope: !137, file: !12, line: 100, type: !16)
!139 = !DILocation(line: 100, column: 12, scope: !137)
!140 = !DILocalVariable(name: "dataBadBuffer", scope: !137, file: !12, line: 101, type: !20)
!141 = !DILocation(line: 101, column: 10, scope: !137)
!142 = !DILocalVariable(name: "dataGoodBuffer", scope: !137, file: !12, line: 102, type: !25)
!143 = !DILocation(line: 102, column: 10, scope: !137)
!144 = !DILocation(line: 108, column: 16, scope: !137)
!145 = !DILocation(line: 108, column: 14, scope: !137)
!146 = !DILocation(line: 109, column: 9, scope: !137)
!147 = !DILocation(line: 109, column: 17, scope: !137)
!148 = !DILocalVariable(name: "source", scope: !149, file: !12, line: 117, type: !25)
!149 = distinct !DILexicalBlock(scope: !137, file: !12, line: 116, column: 5)
!150 = !DILocation(line: 117, column: 14, scope: !149)
!151 = !DILocalVariable(name: "i", scope: !149, file: !12, line: 118, type: !37)
!152 = !DILocation(line: 118, column: 16, scope: !149)
!153 = !DILocalVariable(name: "sourceLen", scope: !149, file: !12, line: 118, type: !37)
!154 = !DILocation(line: 118, column: 19, scope: !149)
!155 = !DILocation(line: 119, column: 28, scope: !149)
!156 = !DILocation(line: 119, column: 21, scope: !149)
!157 = !DILocation(line: 119, column: 19, scope: !149)
!158 = !DILocation(line: 122, column: 16, scope: !159)
!159 = distinct !DILexicalBlock(scope: !149, file: !12, line: 122, column: 9)
!160 = !DILocation(line: 122, column: 14, scope: !159)
!161 = !DILocation(line: 122, column: 21, scope: !162)
!162 = distinct !DILexicalBlock(scope: !159, file: !12, line: 122, column: 9)
!163 = !DILocation(line: 122, column: 25, scope: !162)
!164 = !DILocation(line: 122, column: 35, scope: !162)
!165 = !DILocation(line: 122, column: 23, scope: !162)
!166 = !DILocation(line: 122, column: 9, scope: !159)
!167 = !DILocation(line: 124, column: 30, scope: !168)
!168 = distinct !DILexicalBlock(scope: !162, file: !12, line: 123, column: 9)
!169 = !DILocation(line: 124, column: 23, scope: !168)
!170 = !DILocation(line: 124, column: 13, scope: !168)
!171 = !DILocation(line: 124, column: 18, scope: !168)
!172 = !DILocation(line: 124, column: 21, scope: !168)
!173 = !DILocation(line: 125, column: 9, scope: !168)
!174 = !DILocation(line: 122, column: 41, scope: !162)
!175 = !DILocation(line: 122, column: 9, scope: !162)
!176 = distinct !{!176, !166, !177, !66}
!177 = !DILocation(line: 125, column: 9, scope: !159)
!178 = !DILocation(line: 126, column: 19, scope: !149)
!179 = !DILocation(line: 126, column: 9, scope: !149)
!180 = !DILocation(line: 128, column: 1, scope: !137)

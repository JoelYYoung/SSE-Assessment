; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_04.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_04.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_04_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.goodG2B2.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_04_bad() #0 !dbg !11 {
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
  store i8* %arraydecay, i8** %data, align 8, !dbg !32
  %0 = load i8*, i8** %data, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !33
  store i8 0, i8* %arrayidx, align 1, !dbg !34
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !35, metadata !DIExpression()), !dbg !37
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !37
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_04_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !37
  call void @llvm.dbg.declare(metadata i64* %i, metadata !38, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !43, metadata !DIExpression()), !dbg !44
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !45
  %call = call i64 @strlen(i8* %arraydecay1) #6, !dbg !46
  store i64 %call, i64* %sourceLen, align 8, !dbg !47
  store i64 0, i64* %i, align 8, !dbg !48
  br label %for.cond, !dbg !50

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !51
  %3 = load i64, i64* %sourceLen, align 8, !dbg !53
  %add = add i64 %3, 1, !dbg !54
  %cmp = icmp ult i64 %2, %add, !dbg !55
  br i1 %cmp, label %for.body, label %for.end, !dbg !56

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !57
  %arrayidx2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %4, !dbg !59
  %5 = load i8, i8* %arrayidx2, align 1, !dbg !59
  %6 = load i8*, i8** %data, align 8, !dbg !60
  %7 = load i64, i64* %i, align 8, !dbg !61
  %arrayidx3 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !60
  store i8 %5, i8* %arrayidx3, align 1, !dbg !62
  br label %for.inc, !dbg !63

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !64
  %inc = add i64 %8, 1, !dbg !64
  store i64 %inc, i64* %i, align 8, !dbg !64
  br label %for.cond, !dbg !65, !llvm.loop !66

for.end:                                          ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !69
  call void @printLine(i8* %9), !dbg !70
  ret void, !dbg !71
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_04_good() #0 !dbg !72 {
entry:
  call void @goodG2B1(), !dbg !73
  call void @goodG2B2(), !dbg !74
  ret void, !dbg !75
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !76 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !81, metadata !DIExpression()), !dbg !82
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !83, metadata !DIExpression()), !dbg !84
  %call = call i64 @time(i64* null) #7, !dbg !85
  %conv = trunc i64 %call to i32, !dbg !86
  call void @srand(i32 %conv) #7, !dbg !87
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !88
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_04_good(), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !91
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_04_bad(), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !93
  ret i32 0, !dbg !94
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !95 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !96, metadata !DIExpression()), !dbg !97
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !98, metadata !DIExpression()), !dbg !99
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !100, metadata !DIExpression()), !dbg !101
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !102
  store i8* %arraydecay, i8** %data, align 8, !dbg !105
  %0 = load i8*, i8** %data, align 8, !dbg !106
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !106
  store i8 0, i8* %arrayidx, align 1, !dbg !107
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !108, metadata !DIExpression()), !dbg !110
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !110
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B1.source, i32 0, i32 0), i64 11, i1 false), !dbg !110
  call void @llvm.dbg.declare(metadata i64* %i, metadata !111, metadata !DIExpression()), !dbg !112
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !113, metadata !DIExpression()), !dbg !114
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !115
  %call = call i64 @strlen(i8* %arraydecay1) #6, !dbg !116
  store i64 %call, i64* %sourceLen, align 8, !dbg !117
  store i64 0, i64* %i, align 8, !dbg !118
  br label %for.cond, !dbg !120

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !121
  %3 = load i64, i64* %sourceLen, align 8, !dbg !123
  %add = add i64 %3, 1, !dbg !124
  %cmp = icmp ult i64 %2, %add, !dbg !125
  br i1 %cmp, label %for.body, label %for.end, !dbg !126

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !127
  %arrayidx2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %4, !dbg !129
  %5 = load i8, i8* %arrayidx2, align 1, !dbg !129
  %6 = load i8*, i8** %data, align 8, !dbg !130
  %7 = load i64, i64* %i, align 8, !dbg !131
  %arrayidx3 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !130
  store i8 %5, i8* %arrayidx3, align 1, !dbg !132
  br label %for.inc, !dbg !133

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !134
  %inc = add i64 %8, 1, !dbg !134
  store i64 %inc, i64* %i, align 8, !dbg !134
  br label %for.cond, !dbg !135, !llvm.loop !136

for.end:                                          ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !138
  call void @printLine(i8* %9), !dbg !139
  ret void, !dbg !140
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !141 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !142, metadata !DIExpression()), !dbg !143
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !144, metadata !DIExpression()), !dbg !145
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !146, metadata !DIExpression()), !dbg !147
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !148
  store i8* %arraydecay, i8** %data, align 8, !dbg !151
  %0 = load i8*, i8** %data, align 8, !dbg !152
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !152
  store i8 0, i8* %arrayidx, align 1, !dbg !153
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !154, metadata !DIExpression()), !dbg !156
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !156
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B2.source, i32 0, i32 0), i64 11, i1 false), !dbg !156
  call void @llvm.dbg.declare(metadata i64* %i, metadata !157, metadata !DIExpression()), !dbg !158
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !159, metadata !DIExpression()), !dbg !160
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !161
  %call = call i64 @strlen(i8* %arraydecay1) #6, !dbg !162
  store i64 %call, i64* %sourceLen, align 8, !dbg !163
  store i64 0, i64* %i, align 8, !dbg !164
  br label %for.cond, !dbg !166

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !167
  %3 = load i64, i64* %sourceLen, align 8, !dbg !169
  %add = add i64 %3, 1, !dbg !170
  %cmp = icmp ult i64 %2, %add, !dbg !171
  br i1 %cmp, label %for.body, label %for.end, !dbg !172

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !173
  %arrayidx2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %4, !dbg !175
  %5 = load i8, i8* %arrayidx2, align 1, !dbg !175
  %6 = load i8*, i8** %data, align 8, !dbg !176
  %7 = load i64, i64* %i, align 8, !dbg !177
  %arrayidx3 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !176
  store i8 %5, i8* %arrayidx3, align 1, !dbg !178
  br label %for.inc, !dbg !179

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !180
  %inc = add i64 %8, 1, !dbg !180
  store i64 %inc, i64* %i, align 8, !dbg !180
  br label %for.cond, !dbg !181, !llvm.loop !182

for.end:                                          ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !184
  call void @printLine(i8* %9), !dbg !185
  ret void, !dbg !186
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_04.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_04_bad", scope: !12, file: !12, line: 35, type: !13, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_04.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 37, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 37, column: 12, scope: !11)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 38, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 80, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 10)
!23 = !DILocation(line: 38, column: 10, scope: !11)
!24 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 39, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 88, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 11)
!28 = !DILocation(line: 39, column: 10, scope: !11)
!29 = !DILocation(line: 44, column: 16, scope: !30)
!30 = distinct !DILexicalBlock(scope: !31, file: !12, line: 41, column: 5)
!31 = distinct !DILexicalBlock(scope: !11, file: !12, line: 40, column: 8)
!32 = !DILocation(line: 44, column: 14, scope: !30)
!33 = !DILocation(line: 45, column: 9, scope: !30)
!34 = !DILocation(line: 45, column: 17, scope: !30)
!35 = !DILocalVariable(name: "source", scope: !36, file: !12, line: 48, type: !25)
!36 = distinct !DILexicalBlock(scope: !11, file: !12, line: 47, column: 5)
!37 = !DILocation(line: 48, column: 14, scope: !36)
!38 = !DILocalVariable(name: "i", scope: !36, file: !12, line: 49, type: !39)
!39 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !40, line: 46, baseType: !41)
!40 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!41 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!42 = !DILocation(line: 49, column: 16, scope: !36)
!43 = !DILocalVariable(name: "sourceLen", scope: !36, file: !12, line: 49, type: !39)
!44 = !DILocation(line: 49, column: 19, scope: !36)
!45 = !DILocation(line: 50, column: 28, scope: !36)
!46 = !DILocation(line: 50, column: 21, scope: !36)
!47 = !DILocation(line: 50, column: 19, scope: !36)
!48 = !DILocation(line: 53, column: 16, scope: !49)
!49 = distinct !DILexicalBlock(scope: !36, file: !12, line: 53, column: 9)
!50 = !DILocation(line: 53, column: 14, scope: !49)
!51 = !DILocation(line: 53, column: 21, scope: !52)
!52 = distinct !DILexicalBlock(scope: !49, file: !12, line: 53, column: 9)
!53 = !DILocation(line: 53, column: 25, scope: !52)
!54 = !DILocation(line: 53, column: 35, scope: !52)
!55 = !DILocation(line: 53, column: 23, scope: !52)
!56 = !DILocation(line: 53, column: 9, scope: !49)
!57 = !DILocation(line: 55, column: 30, scope: !58)
!58 = distinct !DILexicalBlock(scope: !52, file: !12, line: 54, column: 9)
!59 = !DILocation(line: 55, column: 23, scope: !58)
!60 = !DILocation(line: 55, column: 13, scope: !58)
!61 = !DILocation(line: 55, column: 18, scope: !58)
!62 = !DILocation(line: 55, column: 21, scope: !58)
!63 = !DILocation(line: 56, column: 9, scope: !58)
!64 = !DILocation(line: 53, column: 41, scope: !52)
!65 = !DILocation(line: 53, column: 9, scope: !52)
!66 = distinct !{!66, !56, !67, !68}
!67 = !DILocation(line: 56, column: 9, scope: !49)
!68 = !{!"llvm.loop.mustprogress"}
!69 = !DILocation(line: 57, column: 19, scope: !36)
!70 = !DILocation(line: 57, column: 9, scope: !36)
!71 = !DILocation(line: 59, column: 1, scope: !11)
!72 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_04_good", scope: !12, file: !12, line: 124, type: !13, scopeLine: 125, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DILocation(line: 126, column: 5, scope: !72)
!74 = !DILocation(line: 127, column: 5, scope: !72)
!75 = !DILocation(line: 128, column: 1, scope: !72)
!76 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 140, type: !77, scopeLine: 141, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DISubroutineType(types: !78)
!78 = !{!79, !79, !80}
!79 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!80 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!81 = !DILocalVariable(name: "argc", arg: 1, scope: !76, file: !12, line: 140, type: !79)
!82 = !DILocation(line: 140, column: 14, scope: !76)
!83 = !DILocalVariable(name: "argv", arg: 2, scope: !76, file: !12, line: 140, type: !80)
!84 = !DILocation(line: 140, column: 27, scope: !76)
!85 = !DILocation(line: 143, column: 22, scope: !76)
!86 = !DILocation(line: 143, column: 12, scope: !76)
!87 = !DILocation(line: 143, column: 5, scope: !76)
!88 = !DILocation(line: 145, column: 5, scope: !76)
!89 = !DILocation(line: 146, column: 5, scope: !76)
!90 = !DILocation(line: 147, column: 5, scope: !76)
!91 = !DILocation(line: 150, column: 5, scope: !76)
!92 = !DILocation(line: 151, column: 5, scope: !76)
!93 = !DILocation(line: 152, column: 5, scope: !76)
!94 = !DILocation(line: 154, column: 5, scope: !76)
!95 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 66, type: !13, scopeLine: 67, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!96 = !DILocalVariable(name: "data", scope: !95, file: !12, line: 68, type: !16)
!97 = !DILocation(line: 68, column: 12, scope: !95)
!98 = !DILocalVariable(name: "dataBadBuffer", scope: !95, file: !12, line: 69, type: !20)
!99 = !DILocation(line: 69, column: 10, scope: !95)
!100 = !DILocalVariable(name: "dataGoodBuffer", scope: !95, file: !12, line: 70, type: !25)
!101 = !DILocation(line: 70, column: 10, scope: !95)
!102 = !DILocation(line: 80, column: 16, scope: !103)
!103 = distinct !DILexicalBlock(scope: !104, file: !12, line: 77, column: 5)
!104 = distinct !DILexicalBlock(scope: !95, file: !12, line: 71, column: 8)
!105 = !DILocation(line: 80, column: 14, scope: !103)
!106 = !DILocation(line: 81, column: 9, scope: !103)
!107 = !DILocation(line: 81, column: 17, scope: !103)
!108 = !DILocalVariable(name: "source", scope: !109, file: !12, line: 84, type: !25)
!109 = distinct !DILexicalBlock(scope: !95, file: !12, line: 83, column: 5)
!110 = !DILocation(line: 84, column: 14, scope: !109)
!111 = !DILocalVariable(name: "i", scope: !109, file: !12, line: 85, type: !39)
!112 = !DILocation(line: 85, column: 16, scope: !109)
!113 = !DILocalVariable(name: "sourceLen", scope: !109, file: !12, line: 85, type: !39)
!114 = !DILocation(line: 85, column: 19, scope: !109)
!115 = !DILocation(line: 86, column: 28, scope: !109)
!116 = !DILocation(line: 86, column: 21, scope: !109)
!117 = !DILocation(line: 86, column: 19, scope: !109)
!118 = !DILocation(line: 89, column: 16, scope: !119)
!119 = distinct !DILexicalBlock(scope: !109, file: !12, line: 89, column: 9)
!120 = !DILocation(line: 89, column: 14, scope: !119)
!121 = !DILocation(line: 89, column: 21, scope: !122)
!122 = distinct !DILexicalBlock(scope: !119, file: !12, line: 89, column: 9)
!123 = !DILocation(line: 89, column: 25, scope: !122)
!124 = !DILocation(line: 89, column: 35, scope: !122)
!125 = !DILocation(line: 89, column: 23, scope: !122)
!126 = !DILocation(line: 89, column: 9, scope: !119)
!127 = !DILocation(line: 91, column: 30, scope: !128)
!128 = distinct !DILexicalBlock(scope: !122, file: !12, line: 90, column: 9)
!129 = !DILocation(line: 91, column: 23, scope: !128)
!130 = !DILocation(line: 91, column: 13, scope: !128)
!131 = !DILocation(line: 91, column: 18, scope: !128)
!132 = !DILocation(line: 91, column: 21, scope: !128)
!133 = !DILocation(line: 92, column: 9, scope: !128)
!134 = !DILocation(line: 89, column: 41, scope: !122)
!135 = !DILocation(line: 89, column: 9, scope: !122)
!136 = distinct !{!136, !126, !137, !68}
!137 = !DILocation(line: 92, column: 9, scope: !119)
!138 = !DILocation(line: 93, column: 19, scope: !109)
!139 = !DILocation(line: 93, column: 9, scope: !109)
!140 = !DILocation(line: 95, column: 1, scope: !95)
!141 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 98, type: !13, scopeLine: 99, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!142 = !DILocalVariable(name: "data", scope: !141, file: !12, line: 100, type: !16)
!143 = !DILocation(line: 100, column: 12, scope: !141)
!144 = !DILocalVariable(name: "dataBadBuffer", scope: !141, file: !12, line: 101, type: !20)
!145 = !DILocation(line: 101, column: 10, scope: !141)
!146 = !DILocalVariable(name: "dataGoodBuffer", scope: !141, file: !12, line: 102, type: !25)
!147 = !DILocation(line: 102, column: 10, scope: !141)
!148 = !DILocation(line: 107, column: 16, scope: !149)
!149 = distinct !DILexicalBlock(scope: !150, file: !12, line: 104, column: 5)
!150 = distinct !DILexicalBlock(scope: !141, file: !12, line: 103, column: 8)
!151 = !DILocation(line: 107, column: 14, scope: !149)
!152 = !DILocation(line: 108, column: 9, scope: !149)
!153 = !DILocation(line: 108, column: 17, scope: !149)
!154 = !DILocalVariable(name: "source", scope: !155, file: !12, line: 111, type: !25)
!155 = distinct !DILexicalBlock(scope: !141, file: !12, line: 110, column: 5)
!156 = !DILocation(line: 111, column: 14, scope: !155)
!157 = !DILocalVariable(name: "i", scope: !155, file: !12, line: 112, type: !39)
!158 = !DILocation(line: 112, column: 16, scope: !155)
!159 = !DILocalVariable(name: "sourceLen", scope: !155, file: !12, line: 112, type: !39)
!160 = !DILocation(line: 112, column: 19, scope: !155)
!161 = !DILocation(line: 113, column: 28, scope: !155)
!162 = !DILocation(line: 113, column: 21, scope: !155)
!163 = !DILocation(line: 113, column: 19, scope: !155)
!164 = !DILocation(line: 116, column: 16, scope: !165)
!165 = distinct !DILexicalBlock(scope: !155, file: !12, line: 116, column: 9)
!166 = !DILocation(line: 116, column: 14, scope: !165)
!167 = !DILocation(line: 116, column: 21, scope: !168)
!168 = distinct !DILexicalBlock(scope: !165, file: !12, line: 116, column: 9)
!169 = !DILocation(line: 116, column: 25, scope: !168)
!170 = !DILocation(line: 116, column: 35, scope: !168)
!171 = !DILocation(line: 116, column: 23, scope: !168)
!172 = !DILocation(line: 116, column: 9, scope: !165)
!173 = !DILocation(line: 118, column: 30, scope: !174)
!174 = distinct !DILexicalBlock(scope: !168, file: !12, line: 117, column: 9)
!175 = !DILocation(line: 118, column: 23, scope: !174)
!176 = !DILocation(line: 118, column: 13, scope: !174)
!177 = !DILocation(line: 118, column: 18, scope: !174)
!178 = !DILocation(line: 118, column: 21, scope: !174)
!179 = !DILocation(line: 119, column: 9, scope: !174)
!180 = !DILocation(line: 116, column: 41, scope: !168)
!181 = !DILocation(line: 116, column: 9, scope: !168)
!182 = distinct !{!182, !172, !183, !68}
!183 = !DILocation(line: 119, column: 9, scope: !165)
!184 = !DILocation(line: 120, column: 19, scope: !155)
!185 = !DILocation(line: 120, column: 9, scope: !155)
!186 = !DILocation(line: 122, column: 1, scope: !141)

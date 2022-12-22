; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_15.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_15_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.goodG2B2.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_15_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = alloca i8, i64 10, align 16, !dbg !21
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !20
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !22, metadata !DIExpression()), !dbg !23
  %1 = alloca i8, i64 11, align 16, !dbg !24
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !23
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !25
  store i8* %2, i8** %data, align 8, !dbg !26
  %3 = load i8*, i8** %data, align 8, !dbg !27
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !27
  store i8 0, i8* %arrayidx, align 1, !dbg !28
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !29, metadata !DIExpression()), !dbg !34
  %4 = bitcast [11 x i8]* %source to i8*, !dbg !34
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %4, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_15_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !34
  call void @llvm.dbg.declare(metadata i64* %i, metadata !35, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !40, metadata !DIExpression()), !dbg !41
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !42
  %call = call i64 @strlen(i8* %arraydecay) #6, !dbg !43
  store i64 %call, i64* %sourceLen, align 8, !dbg !44
  store i64 0, i64* %i, align 8, !dbg !45
  br label %for.cond, !dbg !47

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i64, i64* %i, align 8, !dbg !48
  %6 = load i64, i64* %sourceLen, align 8, !dbg !50
  %add = add i64 %6, 1, !dbg !51
  %cmp = icmp ult i64 %5, %add, !dbg !52
  br i1 %cmp, label %for.body, label %for.end, !dbg !53

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !54
  %arrayidx1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %7, !dbg !56
  %8 = load i8, i8* %arrayidx1, align 1, !dbg !56
  %9 = load i8*, i8** %data, align 8, !dbg !57
  %10 = load i64, i64* %i, align 8, !dbg !58
  %arrayidx2 = getelementptr inbounds i8, i8* %9, i64 %10, !dbg !57
  store i8 %8, i8* %arrayidx2, align 1, !dbg !59
  br label %for.inc, !dbg !60

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !61
  %inc = add i64 %11, 1, !dbg !61
  store i64 %inc, i64* %i, align 8, !dbg !61
  br label %for.cond, !dbg !62, !llvm.loop !63

for.end:                                          ; preds = %for.cond
  %12 = load i8*, i8** %data, align 8, !dbg !66
  call void @printLine(i8* %12), !dbg !67
  ret void, !dbg !68
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_15_good() #0 !dbg !69 {
entry:
  call void @goodG2B1(), !dbg !70
  call void @goodG2B2(), !dbg !71
  ret void, !dbg !72
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !73 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !78, metadata !DIExpression()), !dbg !79
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !80, metadata !DIExpression()), !dbg !81
  %call = call i64 @time(i64* null) #7, !dbg !82
  %conv = trunc i64 %call to i32, !dbg !83
  call void @srand(i32 %conv) #7, !dbg !84
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !85
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_15_good(), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !88
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_15_bad(), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !90
  ret i32 0, !dbg !91
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !92 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !93, metadata !DIExpression()), !dbg !94
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !95, metadata !DIExpression()), !dbg !96
  %0 = alloca i8, i64 10, align 16, !dbg !97
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !96
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !98, metadata !DIExpression()), !dbg !99
  %1 = alloca i8, i64 11, align 16, !dbg !100
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !99
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !101
  store i8* %2, i8** %data, align 8, !dbg !102
  %3 = load i8*, i8** %data, align 8, !dbg !103
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !103
  store i8 0, i8* %arrayidx, align 1, !dbg !104
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !105, metadata !DIExpression()), !dbg !107
  %4 = bitcast [11 x i8]* %source to i8*, !dbg !107
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %4, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B1.source, i32 0, i32 0), i64 11, i1 false), !dbg !107
  call void @llvm.dbg.declare(metadata i64* %i, metadata !108, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !110, metadata !DIExpression()), !dbg !111
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !112
  %call = call i64 @strlen(i8* %arraydecay) #6, !dbg !113
  store i64 %call, i64* %sourceLen, align 8, !dbg !114
  store i64 0, i64* %i, align 8, !dbg !115
  br label %for.cond, !dbg !117

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i64, i64* %i, align 8, !dbg !118
  %6 = load i64, i64* %sourceLen, align 8, !dbg !120
  %add = add i64 %6, 1, !dbg !121
  %cmp = icmp ult i64 %5, %add, !dbg !122
  br i1 %cmp, label %for.body, label %for.end, !dbg !123

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !124
  %arrayidx1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %7, !dbg !126
  %8 = load i8, i8* %arrayidx1, align 1, !dbg !126
  %9 = load i8*, i8** %data, align 8, !dbg !127
  %10 = load i64, i64* %i, align 8, !dbg !128
  %arrayidx2 = getelementptr inbounds i8, i8* %9, i64 %10, !dbg !127
  store i8 %8, i8* %arrayidx2, align 1, !dbg !129
  br label %for.inc, !dbg !130

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !131
  %inc = add i64 %11, 1, !dbg !131
  store i64 %inc, i64* %i, align 8, !dbg !131
  br label %for.cond, !dbg !132, !llvm.loop !133

for.end:                                          ; preds = %for.cond
  %12 = load i8*, i8** %data, align 8, !dbg !135
  call void @printLine(i8* %12), !dbg !136
  ret void, !dbg !137
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !138 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !139, metadata !DIExpression()), !dbg !140
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !141, metadata !DIExpression()), !dbg !142
  %0 = alloca i8, i64 10, align 16, !dbg !143
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !142
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !144, metadata !DIExpression()), !dbg !145
  %1 = alloca i8, i64 11, align 16, !dbg !146
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !145
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !147
  store i8* %2, i8** %data, align 8, !dbg !148
  %3 = load i8*, i8** %data, align 8, !dbg !149
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !149
  store i8 0, i8* %arrayidx, align 1, !dbg !150
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !151, metadata !DIExpression()), !dbg !153
  %4 = bitcast [11 x i8]* %source to i8*, !dbg !153
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %4, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B2.source, i32 0, i32 0), i64 11, i1 false), !dbg !153
  call void @llvm.dbg.declare(metadata i64* %i, metadata !154, metadata !DIExpression()), !dbg !155
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !156, metadata !DIExpression()), !dbg !157
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !158
  %call = call i64 @strlen(i8* %arraydecay) #6, !dbg !159
  store i64 %call, i64* %sourceLen, align 8, !dbg !160
  store i64 0, i64* %i, align 8, !dbg !161
  br label %for.cond, !dbg !163

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i64, i64* %i, align 8, !dbg !164
  %6 = load i64, i64* %sourceLen, align 8, !dbg !166
  %add = add i64 %6, 1, !dbg !167
  %cmp = icmp ult i64 %5, %add, !dbg !168
  br i1 %cmp, label %for.body, label %for.end, !dbg !169

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !170
  %arrayidx1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %7, !dbg !172
  %8 = load i8, i8* %arrayidx1, align 1, !dbg !172
  %9 = load i8*, i8** %data, align 8, !dbg !173
  %10 = load i64, i64* %i, align 8, !dbg !174
  %arrayidx2 = getelementptr inbounds i8, i8* %9, i64 %10, !dbg !173
  store i8 %8, i8* %arrayidx2, align 1, !dbg !175
  br label %for.inc, !dbg !176

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !177
  %inc = add i64 %11, 1, !dbg !177
  store i64 %inc, i64* %i, align 8, !dbg !177
  br label %for.cond, !dbg !178, !llvm.loop !179

for.end:                                          ; preds = %for.cond
  %12 = load i8*, i8** %data, align 8, !dbg !181
  call void @printLine(i8* %12), !dbg !182
  ret void, !dbg !183
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
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_15.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_15_bad", scope: !14, file: !14, line: 28, type: !15, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_15.c", directory: "/root/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 30, type: !4)
!18 = !DILocation(line: 30, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 31, type: !4)
!20 = !DILocation(line: 31, column: 12, scope: !13)
!21 = !DILocation(line: 31, column: 36, scope: !13)
!22 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 32, type: !4)
!23 = !DILocation(line: 32, column: 12, scope: !13)
!24 = !DILocation(line: 32, column: 37, scope: !13)
!25 = !DILocation(line: 38, column: 16, scope: !13)
!26 = !DILocation(line: 38, column: 14, scope: !13)
!27 = !DILocation(line: 39, column: 9, scope: !13)
!28 = !DILocation(line: 39, column: 17, scope: !13)
!29 = !DILocalVariable(name: "source", scope: !30, file: !14, line: 47, type: !31)
!30 = distinct !DILexicalBlock(scope: !13, file: !14, line: 46, column: 5)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 88, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 11)
!34 = !DILocation(line: 47, column: 14, scope: !30)
!35 = !DILocalVariable(name: "i", scope: !30, file: !14, line: 48, type: !36)
!36 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !37, line: 46, baseType: !38)
!37 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!38 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!39 = !DILocation(line: 48, column: 16, scope: !30)
!40 = !DILocalVariable(name: "sourceLen", scope: !30, file: !14, line: 48, type: !36)
!41 = !DILocation(line: 48, column: 19, scope: !30)
!42 = !DILocation(line: 49, column: 28, scope: !30)
!43 = !DILocation(line: 49, column: 21, scope: !30)
!44 = !DILocation(line: 49, column: 19, scope: !30)
!45 = !DILocation(line: 52, column: 16, scope: !46)
!46 = distinct !DILexicalBlock(scope: !30, file: !14, line: 52, column: 9)
!47 = !DILocation(line: 52, column: 14, scope: !46)
!48 = !DILocation(line: 52, column: 21, scope: !49)
!49 = distinct !DILexicalBlock(scope: !46, file: !14, line: 52, column: 9)
!50 = !DILocation(line: 52, column: 25, scope: !49)
!51 = !DILocation(line: 52, column: 35, scope: !49)
!52 = !DILocation(line: 52, column: 23, scope: !49)
!53 = !DILocation(line: 52, column: 9, scope: !46)
!54 = !DILocation(line: 54, column: 30, scope: !55)
!55 = distinct !DILexicalBlock(scope: !49, file: !14, line: 53, column: 9)
!56 = !DILocation(line: 54, column: 23, scope: !55)
!57 = !DILocation(line: 54, column: 13, scope: !55)
!58 = !DILocation(line: 54, column: 18, scope: !55)
!59 = !DILocation(line: 54, column: 21, scope: !55)
!60 = !DILocation(line: 55, column: 9, scope: !55)
!61 = !DILocation(line: 52, column: 41, scope: !49)
!62 = !DILocation(line: 52, column: 9, scope: !49)
!63 = distinct !{!63, !53, !64, !65}
!64 = !DILocation(line: 55, column: 9, scope: !46)
!65 = !{!"llvm.loop.mustprogress"}
!66 = !DILocation(line: 56, column: 19, scope: !30)
!67 = !DILocation(line: 56, column: 9, scope: !30)
!68 = !DILocation(line: 58, column: 1, scope: !13)
!69 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_15_good", scope: !14, file: !14, line: 130, type: !15, scopeLine: 131, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DILocation(line: 132, column: 5, scope: !69)
!71 = !DILocation(line: 133, column: 5, scope: !69)
!72 = !DILocation(line: 134, column: 1, scope: !69)
!73 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 146, type: !74, scopeLine: 147, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DISubroutineType(types: !75)
!75 = !{!76, !76, !77}
!76 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!78 = !DILocalVariable(name: "argc", arg: 1, scope: !73, file: !14, line: 146, type: !76)
!79 = !DILocation(line: 146, column: 14, scope: !73)
!80 = !DILocalVariable(name: "argv", arg: 2, scope: !73, file: !14, line: 146, type: !77)
!81 = !DILocation(line: 146, column: 27, scope: !73)
!82 = !DILocation(line: 149, column: 22, scope: !73)
!83 = !DILocation(line: 149, column: 12, scope: !73)
!84 = !DILocation(line: 149, column: 5, scope: !73)
!85 = !DILocation(line: 151, column: 5, scope: !73)
!86 = !DILocation(line: 152, column: 5, scope: !73)
!87 = !DILocation(line: 153, column: 5, scope: !73)
!88 = !DILocation(line: 156, column: 5, scope: !73)
!89 = !DILocation(line: 157, column: 5, scope: !73)
!90 = !DILocation(line: 158, column: 5, scope: !73)
!91 = !DILocation(line: 160, column: 5, scope: !73)
!92 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 65, type: !15, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!93 = !DILocalVariable(name: "data", scope: !92, file: !14, line: 67, type: !4)
!94 = !DILocation(line: 67, column: 12, scope: !92)
!95 = !DILocalVariable(name: "dataBadBuffer", scope: !92, file: !14, line: 68, type: !4)
!96 = !DILocation(line: 68, column: 12, scope: !92)
!97 = !DILocation(line: 68, column: 36, scope: !92)
!98 = !DILocalVariable(name: "dataGoodBuffer", scope: !92, file: !14, line: 69, type: !4)
!99 = !DILocation(line: 69, column: 12, scope: !92)
!100 = !DILocation(line: 69, column: 37, scope: !92)
!101 = !DILocation(line: 79, column: 16, scope: !92)
!102 = !DILocation(line: 79, column: 14, scope: !92)
!103 = !DILocation(line: 80, column: 9, scope: !92)
!104 = !DILocation(line: 80, column: 17, scope: !92)
!105 = !DILocalVariable(name: "source", scope: !106, file: !14, line: 84, type: !31)
!106 = distinct !DILexicalBlock(scope: !92, file: !14, line: 83, column: 5)
!107 = !DILocation(line: 84, column: 14, scope: !106)
!108 = !DILocalVariable(name: "i", scope: !106, file: !14, line: 85, type: !36)
!109 = !DILocation(line: 85, column: 16, scope: !106)
!110 = !DILocalVariable(name: "sourceLen", scope: !106, file: !14, line: 85, type: !36)
!111 = !DILocation(line: 85, column: 19, scope: !106)
!112 = !DILocation(line: 86, column: 28, scope: !106)
!113 = !DILocation(line: 86, column: 21, scope: !106)
!114 = !DILocation(line: 86, column: 19, scope: !106)
!115 = !DILocation(line: 89, column: 16, scope: !116)
!116 = distinct !DILexicalBlock(scope: !106, file: !14, line: 89, column: 9)
!117 = !DILocation(line: 89, column: 14, scope: !116)
!118 = !DILocation(line: 89, column: 21, scope: !119)
!119 = distinct !DILexicalBlock(scope: !116, file: !14, line: 89, column: 9)
!120 = !DILocation(line: 89, column: 25, scope: !119)
!121 = !DILocation(line: 89, column: 35, scope: !119)
!122 = !DILocation(line: 89, column: 23, scope: !119)
!123 = !DILocation(line: 89, column: 9, scope: !116)
!124 = !DILocation(line: 91, column: 30, scope: !125)
!125 = distinct !DILexicalBlock(scope: !119, file: !14, line: 90, column: 9)
!126 = !DILocation(line: 91, column: 23, scope: !125)
!127 = !DILocation(line: 91, column: 13, scope: !125)
!128 = !DILocation(line: 91, column: 18, scope: !125)
!129 = !DILocation(line: 91, column: 21, scope: !125)
!130 = !DILocation(line: 92, column: 9, scope: !125)
!131 = !DILocation(line: 89, column: 41, scope: !119)
!132 = !DILocation(line: 89, column: 9, scope: !119)
!133 = distinct !{!133, !123, !134, !65}
!134 = !DILocation(line: 92, column: 9, scope: !116)
!135 = !DILocation(line: 93, column: 19, scope: !106)
!136 = !DILocation(line: 93, column: 9, scope: !106)
!137 = !DILocation(line: 95, column: 1, scope: !92)
!138 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 98, type: !15, scopeLine: 99, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!139 = !DILocalVariable(name: "data", scope: !138, file: !14, line: 100, type: !4)
!140 = !DILocation(line: 100, column: 12, scope: !138)
!141 = !DILocalVariable(name: "dataBadBuffer", scope: !138, file: !14, line: 101, type: !4)
!142 = !DILocation(line: 101, column: 12, scope: !138)
!143 = !DILocation(line: 101, column: 36, scope: !138)
!144 = !DILocalVariable(name: "dataGoodBuffer", scope: !138, file: !14, line: 102, type: !4)
!145 = !DILocation(line: 102, column: 12, scope: !138)
!146 = !DILocation(line: 102, column: 37, scope: !138)
!147 = !DILocation(line: 108, column: 16, scope: !138)
!148 = !DILocation(line: 108, column: 14, scope: !138)
!149 = !DILocation(line: 109, column: 9, scope: !138)
!150 = !DILocation(line: 109, column: 17, scope: !138)
!151 = !DILocalVariable(name: "source", scope: !152, file: !14, line: 117, type: !31)
!152 = distinct !DILexicalBlock(scope: !138, file: !14, line: 116, column: 5)
!153 = !DILocation(line: 117, column: 14, scope: !152)
!154 = !DILocalVariable(name: "i", scope: !152, file: !14, line: 118, type: !36)
!155 = !DILocation(line: 118, column: 16, scope: !152)
!156 = !DILocalVariable(name: "sourceLen", scope: !152, file: !14, line: 118, type: !36)
!157 = !DILocation(line: 118, column: 19, scope: !152)
!158 = !DILocation(line: 119, column: 28, scope: !152)
!159 = !DILocation(line: 119, column: 21, scope: !152)
!160 = !DILocation(line: 119, column: 19, scope: !152)
!161 = !DILocation(line: 122, column: 16, scope: !162)
!162 = distinct !DILexicalBlock(scope: !152, file: !14, line: 122, column: 9)
!163 = !DILocation(line: 122, column: 14, scope: !162)
!164 = !DILocation(line: 122, column: 21, scope: !165)
!165 = distinct !DILexicalBlock(scope: !162, file: !14, line: 122, column: 9)
!166 = !DILocation(line: 122, column: 25, scope: !165)
!167 = !DILocation(line: 122, column: 35, scope: !165)
!168 = !DILocation(line: 122, column: 23, scope: !165)
!169 = !DILocation(line: 122, column: 9, scope: !162)
!170 = !DILocation(line: 124, column: 30, scope: !171)
!171 = distinct !DILexicalBlock(scope: !165, file: !14, line: 123, column: 9)
!172 = !DILocation(line: 124, column: 23, scope: !171)
!173 = !DILocation(line: 124, column: 13, scope: !171)
!174 = !DILocation(line: 124, column: 18, scope: !171)
!175 = !DILocation(line: 124, column: 21, scope: !171)
!176 = !DILocation(line: 125, column: 9, scope: !171)
!177 = !DILocation(line: 122, column: 41, scope: !165)
!178 = !DILocation(line: 122, column: 9, scope: !165)
!179 = distinct !{!179, !169, !180, !65}
!180 = !DILocation(line: 125, column: 9, scope: !162)
!181 = !DILocation(line: 126, column: 19, scope: !152)
!182 = !DILocation(line: 126, column: 9, scope: !152)
!183 = !DILocation(line: 128, column: 1, scope: !138)

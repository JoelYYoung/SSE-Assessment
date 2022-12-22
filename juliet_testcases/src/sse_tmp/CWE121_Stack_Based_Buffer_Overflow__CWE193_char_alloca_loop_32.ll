; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_32.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_32_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_32_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !19, metadata !DIExpression()), !dbg !21
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !21
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !22, metadata !DIExpression()), !dbg !23
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = alloca i8, i64 10, align 16, !dbg !26
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !27, metadata !DIExpression()), !dbg !28
  %1 = alloca i8, i64 11, align 16, !dbg !29
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !28
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !30, metadata !DIExpression()), !dbg !32
  %2 = load i8**, i8*** %dataPtr1, align 8, !dbg !33
  %3 = load i8*, i8** %2, align 8, !dbg !34
  store i8* %3, i8** %data1, align 8, !dbg !32
  %4 = load i8*, i8** %dataBadBuffer, align 8, !dbg !35
  store i8* %4, i8** %data1, align 8, !dbg !36
  %5 = load i8*, i8** %data1, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 0, !dbg !37
  store i8 0, i8* %arrayidx, align 1, !dbg !38
  %6 = load i8*, i8** %data1, align 8, !dbg !39
  %7 = load i8**, i8*** %dataPtr1, align 8, !dbg !40
  store i8* %6, i8** %7, align 8, !dbg !41
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !42, metadata !DIExpression()), !dbg !44
  %8 = load i8**, i8*** %dataPtr2, align 8, !dbg !45
  %9 = load i8*, i8** %8, align 8, !dbg !46
  store i8* %9, i8** %data2, align 8, !dbg !44
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !47, metadata !DIExpression()), !dbg !52
  %10 = bitcast [11 x i8]* %source to i8*, !dbg !52
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %10, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_32_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !52
  call void @llvm.dbg.declare(metadata i64* %i, metadata !53, metadata !DIExpression()), !dbg !57
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !58, metadata !DIExpression()), !dbg !59
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !60
  %call = call i64 @strlen(i8* %arraydecay) #6, !dbg !61
  store i64 %call, i64* %sourceLen, align 8, !dbg !62
  store i64 0, i64* %i, align 8, !dbg !63
  br label %for.cond, !dbg !65

for.cond:                                         ; preds = %for.inc, %entry
  %11 = load i64, i64* %i, align 8, !dbg !66
  %12 = load i64, i64* %sourceLen, align 8, !dbg !68
  %add = add i64 %12, 1, !dbg !69
  %cmp = icmp ult i64 %11, %add, !dbg !70
  br i1 %cmp, label %for.body, label %for.end, !dbg !71

for.body:                                         ; preds = %for.cond
  %13 = load i64, i64* %i, align 8, !dbg !72
  %arrayidx3 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %13, !dbg !74
  %14 = load i8, i8* %arrayidx3, align 1, !dbg !74
  %15 = load i8*, i8** %data2, align 8, !dbg !75
  %16 = load i64, i64* %i, align 8, !dbg !76
  %arrayidx4 = getelementptr inbounds i8, i8* %15, i64 %16, !dbg !75
  store i8 %14, i8* %arrayidx4, align 1, !dbg !77
  br label %for.inc, !dbg !78

for.inc:                                          ; preds = %for.body
  %17 = load i64, i64* %i, align 8, !dbg !79
  %inc = add i64 %17, 1, !dbg !79
  store i64 %inc, i64* %i, align 8, !dbg !79
  br label %for.cond, !dbg !80, !llvm.loop !81

for.end:                                          ; preds = %for.cond
  %18 = load i8*, i8** %data2, align 8, !dbg !84
  call void @printLine(i8* %18), !dbg !85
  ret void, !dbg !86
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_32_good() #0 !dbg !87 {
entry:
  call void @goodG2B(), !dbg !88
  ret void, !dbg !89
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !90 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !94, metadata !DIExpression()), !dbg !95
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !96, metadata !DIExpression()), !dbg !97
  %call = call i64 @time(i64* null) #7, !dbg !98
  %conv = trunc i64 %call to i32, !dbg !99
  call void @srand(i32 %conv) #7, !dbg !100
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !101
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_32_good(), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !103
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !104
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_32_bad(), !dbg !105
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !106
  ret i32 0, !dbg !107
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !108 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !109, metadata !DIExpression()), !dbg !110
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !111, metadata !DIExpression()), !dbg !112
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !112
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !113, metadata !DIExpression()), !dbg !114
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !114
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !115, metadata !DIExpression()), !dbg !116
  %0 = alloca i8, i64 10, align 16, !dbg !117
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !116
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !118, metadata !DIExpression()), !dbg !119
  %1 = alloca i8, i64 11, align 16, !dbg !120
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !119
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !121, metadata !DIExpression()), !dbg !123
  %2 = load i8**, i8*** %dataPtr1, align 8, !dbg !124
  %3 = load i8*, i8** %2, align 8, !dbg !125
  store i8* %3, i8** %data1, align 8, !dbg !123
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !126
  store i8* %4, i8** %data1, align 8, !dbg !127
  %5 = load i8*, i8** %data1, align 8, !dbg !128
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 0, !dbg !128
  store i8 0, i8* %arrayidx, align 1, !dbg !129
  %6 = load i8*, i8** %data1, align 8, !dbg !130
  %7 = load i8**, i8*** %dataPtr1, align 8, !dbg !131
  store i8* %6, i8** %7, align 8, !dbg !132
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !133, metadata !DIExpression()), !dbg !135
  %8 = load i8**, i8*** %dataPtr2, align 8, !dbg !136
  %9 = load i8*, i8** %8, align 8, !dbg !137
  store i8* %9, i8** %data2, align 8, !dbg !135
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !138, metadata !DIExpression()), !dbg !140
  %10 = bitcast [11 x i8]* %source to i8*, !dbg !140
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %10, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B.source, i32 0, i32 0), i64 11, i1 false), !dbg !140
  call void @llvm.dbg.declare(metadata i64* %i, metadata !141, metadata !DIExpression()), !dbg !142
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !143, metadata !DIExpression()), !dbg !144
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !145
  %call = call i64 @strlen(i8* %arraydecay) #6, !dbg !146
  store i64 %call, i64* %sourceLen, align 8, !dbg !147
  store i64 0, i64* %i, align 8, !dbg !148
  br label %for.cond, !dbg !150

for.cond:                                         ; preds = %for.inc, %entry
  %11 = load i64, i64* %i, align 8, !dbg !151
  %12 = load i64, i64* %sourceLen, align 8, !dbg !153
  %add = add i64 %12, 1, !dbg !154
  %cmp = icmp ult i64 %11, %add, !dbg !155
  br i1 %cmp, label %for.body, label %for.end, !dbg !156

for.body:                                         ; preds = %for.cond
  %13 = load i64, i64* %i, align 8, !dbg !157
  %arrayidx3 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %13, !dbg !159
  %14 = load i8, i8* %arrayidx3, align 1, !dbg !159
  %15 = load i8*, i8** %data2, align 8, !dbg !160
  %16 = load i64, i64* %i, align 8, !dbg !161
  %arrayidx4 = getelementptr inbounds i8, i8* %15, i64 %16, !dbg !160
  store i8 %14, i8* %arrayidx4, align 1, !dbg !162
  br label %for.inc, !dbg !163

for.inc:                                          ; preds = %for.body
  %17 = load i64, i64* %i, align 8, !dbg !164
  %inc = add i64 %17, 1, !dbg !164
  store i64 %inc, i64* %i, align 8, !dbg !164
  br label %for.cond, !dbg !165, !llvm.loop !166

for.end:                                          ; preds = %for.cond
  %18 = load i8*, i8** %data2, align 8, !dbg !168
  call void @printLine(i8* %18), !dbg !169
  ret void, !dbg !170
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_32.c", directory: "/root/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_32_bad", scope: !14, file: !14, line: 28, type: !15, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_32.c", directory: "/root/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 30, type: !4)
!18 = !DILocation(line: 30, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataPtr1", scope: !13, file: !14, line: 31, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!21 = !DILocation(line: 31, column: 13, scope: !13)
!22 = !DILocalVariable(name: "dataPtr2", scope: !13, file: !14, line: 32, type: !20)
!23 = !DILocation(line: 32, column: 13, scope: !13)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 33, type: !4)
!25 = !DILocation(line: 33, column: 12, scope: !13)
!26 = !DILocation(line: 33, column: 36, scope: !13)
!27 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 34, type: !4)
!28 = !DILocation(line: 34, column: 12, scope: !13)
!29 = !DILocation(line: 34, column: 37, scope: !13)
!30 = !DILocalVariable(name: "data", scope: !31, file: !14, line: 36, type: !4)
!31 = distinct !DILexicalBlock(scope: !13, file: !14, line: 35, column: 5)
!32 = !DILocation(line: 36, column: 16, scope: !31)
!33 = !DILocation(line: 36, column: 24, scope: !31)
!34 = !DILocation(line: 36, column: 23, scope: !31)
!35 = !DILocation(line: 39, column: 16, scope: !31)
!36 = !DILocation(line: 39, column: 14, scope: !31)
!37 = !DILocation(line: 40, column: 9, scope: !31)
!38 = !DILocation(line: 40, column: 17, scope: !31)
!39 = !DILocation(line: 41, column: 21, scope: !31)
!40 = !DILocation(line: 41, column: 10, scope: !31)
!41 = !DILocation(line: 41, column: 19, scope: !31)
!42 = !DILocalVariable(name: "data", scope: !43, file: !14, line: 44, type: !4)
!43 = distinct !DILexicalBlock(scope: !13, file: !14, line: 43, column: 5)
!44 = !DILocation(line: 44, column: 16, scope: !43)
!45 = !DILocation(line: 44, column: 24, scope: !43)
!46 = !DILocation(line: 44, column: 23, scope: !43)
!47 = !DILocalVariable(name: "source", scope: !48, file: !14, line: 46, type: !49)
!48 = distinct !DILexicalBlock(scope: !43, file: !14, line: 45, column: 9)
!49 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 88, elements: !50)
!50 = !{!51}
!51 = !DISubrange(count: 11)
!52 = !DILocation(line: 46, column: 18, scope: !48)
!53 = !DILocalVariable(name: "i", scope: !48, file: !14, line: 47, type: !54)
!54 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !55, line: 46, baseType: !56)
!55 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!56 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!57 = !DILocation(line: 47, column: 20, scope: !48)
!58 = !DILocalVariable(name: "sourceLen", scope: !48, file: !14, line: 47, type: !54)
!59 = !DILocation(line: 47, column: 23, scope: !48)
!60 = !DILocation(line: 48, column: 32, scope: !48)
!61 = !DILocation(line: 48, column: 25, scope: !48)
!62 = !DILocation(line: 48, column: 23, scope: !48)
!63 = !DILocation(line: 51, column: 20, scope: !64)
!64 = distinct !DILexicalBlock(scope: !48, file: !14, line: 51, column: 13)
!65 = !DILocation(line: 51, column: 18, scope: !64)
!66 = !DILocation(line: 51, column: 25, scope: !67)
!67 = distinct !DILexicalBlock(scope: !64, file: !14, line: 51, column: 13)
!68 = !DILocation(line: 51, column: 29, scope: !67)
!69 = !DILocation(line: 51, column: 39, scope: !67)
!70 = !DILocation(line: 51, column: 27, scope: !67)
!71 = !DILocation(line: 51, column: 13, scope: !64)
!72 = !DILocation(line: 53, column: 34, scope: !73)
!73 = distinct !DILexicalBlock(scope: !67, file: !14, line: 52, column: 13)
!74 = !DILocation(line: 53, column: 27, scope: !73)
!75 = !DILocation(line: 53, column: 17, scope: !73)
!76 = !DILocation(line: 53, column: 22, scope: !73)
!77 = !DILocation(line: 53, column: 25, scope: !73)
!78 = !DILocation(line: 54, column: 13, scope: !73)
!79 = !DILocation(line: 51, column: 45, scope: !67)
!80 = !DILocation(line: 51, column: 13, scope: !67)
!81 = distinct !{!81, !71, !82, !83}
!82 = !DILocation(line: 54, column: 13, scope: !64)
!83 = !{!"llvm.loop.mustprogress"}
!84 = !DILocation(line: 55, column: 23, scope: !48)
!85 = !DILocation(line: 55, column: 13, scope: !48)
!86 = !DILocation(line: 58, column: 1, scope: !13)
!87 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_32_good", scope: !14, file: !14, line: 97, type: !15, scopeLine: 98, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DILocation(line: 99, column: 5, scope: !87)
!89 = !DILocation(line: 100, column: 1, scope: !87)
!90 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 111, type: !91, scopeLine: 112, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!91 = !DISubroutineType(types: !92)
!92 = !{!93, !93, !20}
!93 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!94 = !DILocalVariable(name: "argc", arg: 1, scope: !90, file: !14, line: 111, type: !93)
!95 = !DILocation(line: 111, column: 14, scope: !90)
!96 = !DILocalVariable(name: "argv", arg: 2, scope: !90, file: !14, line: 111, type: !20)
!97 = !DILocation(line: 111, column: 27, scope: !90)
!98 = !DILocation(line: 114, column: 22, scope: !90)
!99 = !DILocation(line: 114, column: 12, scope: !90)
!100 = !DILocation(line: 114, column: 5, scope: !90)
!101 = !DILocation(line: 116, column: 5, scope: !90)
!102 = !DILocation(line: 117, column: 5, scope: !90)
!103 = !DILocation(line: 118, column: 5, scope: !90)
!104 = !DILocation(line: 121, column: 5, scope: !90)
!105 = !DILocation(line: 122, column: 5, scope: !90)
!106 = !DILocation(line: 123, column: 5, scope: !90)
!107 = !DILocation(line: 125, column: 5, scope: !90)
!108 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 65, type: !15, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!109 = !DILocalVariable(name: "data", scope: !108, file: !14, line: 67, type: !4)
!110 = !DILocation(line: 67, column: 12, scope: !108)
!111 = !DILocalVariable(name: "dataPtr1", scope: !108, file: !14, line: 68, type: !20)
!112 = !DILocation(line: 68, column: 13, scope: !108)
!113 = !DILocalVariable(name: "dataPtr2", scope: !108, file: !14, line: 69, type: !20)
!114 = !DILocation(line: 69, column: 13, scope: !108)
!115 = !DILocalVariable(name: "dataBadBuffer", scope: !108, file: !14, line: 70, type: !4)
!116 = !DILocation(line: 70, column: 12, scope: !108)
!117 = !DILocation(line: 70, column: 36, scope: !108)
!118 = !DILocalVariable(name: "dataGoodBuffer", scope: !108, file: !14, line: 71, type: !4)
!119 = !DILocation(line: 71, column: 12, scope: !108)
!120 = !DILocation(line: 71, column: 37, scope: !108)
!121 = !DILocalVariable(name: "data", scope: !122, file: !14, line: 73, type: !4)
!122 = distinct !DILexicalBlock(scope: !108, file: !14, line: 72, column: 5)
!123 = !DILocation(line: 73, column: 16, scope: !122)
!124 = !DILocation(line: 73, column: 24, scope: !122)
!125 = !DILocation(line: 73, column: 23, scope: !122)
!126 = !DILocation(line: 76, column: 16, scope: !122)
!127 = !DILocation(line: 76, column: 14, scope: !122)
!128 = !DILocation(line: 77, column: 9, scope: !122)
!129 = !DILocation(line: 77, column: 17, scope: !122)
!130 = !DILocation(line: 78, column: 21, scope: !122)
!131 = !DILocation(line: 78, column: 10, scope: !122)
!132 = !DILocation(line: 78, column: 19, scope: !122)
!133 = !DILocalVariable(name: "data", scope: !134, file: !14, line: 81, type: !4)
!134 = distinct !DILexicalBlock(scope: !108, file: !14, line: 80, column: 5)
!135 = !DILocation(line: 81, column: 16, scope: !134)
!136 = !DILocation(line: 81, column: 24, scope: !134)
!137 = !DILocation(line: 81, column: 23, scope: !134)
!138 = !DILocalVariable(name: "source", scope: !139, file: !14, line: 83, type: !49)
!139 = distinct !DILexicalBlock(scope: !134, file: !14, line: 82, column: 9)
!140 = !DILocation(line: 83, column: 18, scope: !139)
!141 = !DILocalVariable(name: "i", scope: !139, file: !14, line: 84, type: !54)
!142 = !DILocation(line: 84, column: 20, scope: !139)
!143 = !DILocalVariable(name: "sourceLen", scope: !139, file: !14, line: 84, type: !54)
!144 = !DILocation(line: 84, column: 23, scope: !139)
!145 = !DILocation(line: 85, column: 32, scope: !139)
!146 = !DILocation(line: 85, column: 25, scope: !139)
!147 = !DILocation(line: 85, column: 23, scope: !139)
!148 = !DILocation(line: 88, column: 20, scope: !149)
!149 = distinct !DILexicalBlock(scope: !139, file: !14, line: 88, column: 13)
!150 = !DILocation(line: 88, column: 18, scope: !149)
!151 = !DILocation(line: 88, column: 25, scope: !152)
!152 = distinct !DILexicalBlock(scope: !149, file: !14, line: 88, column: 13)
!153 = !DILocation(line: 88, column: 29, scope: !152)
!154 = !DILocation(line: 88, column: 39, scope: !152)
!155 = !DILocation(line: 88, column: 27, scope: !152)
!156 = !DILocation(line: 88, column: 13, scope: !149)
!157 = !DILocation(line: 90, column: 34, scope: !158)
!158 = distinct !DILexicalBlock(scope: !152, file: !14, line: 89, column: 13)
!159 = !DILocation(line: 90, column: 27, scope: !158)
!160 = !DILocation(line: 90, column: 17, scope: !158)
!161 = !DILocation(line: 90, column: 22, scope: !158)
!162 = !DILocation(line: 90, column: 25, scope: !158)
!163 = !DILocation(line: 91, column: 13, scope: !158)
!164 = !DILocation(line: 88, column: 45, scope: !152)
!165 = !DILocation(line: 88, column: 13, scope: !152)
!166 = distinct !{!166, !156, !167, !83}
!167 = !DILocation(line: 91, column: 13, scope: !149)
!168 = !DILocation(line: 92, column: 23, scope: !139)
!169 = !DILocation(line: 92, column: 13, scope: !139)
!170 = !DILocation(line: 95, column: 1, scope: !108)

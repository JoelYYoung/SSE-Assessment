; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_32.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_32_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_32_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %data1 = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !19, metadata !DIExpression()), !dbg !21
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !21
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !22, metadata !DIExpression()), !dbg !23
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !29, metadata !DIExpression()), !dbg !33
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !34, metadata !DIExpression()), !dbg !36
  %0 = load i8**, i8*** %dataPtr1, align 8, !dbg !37
  %1 = load i8*, i8** %0, align 8, !dbg !38
  store i8* %1, i8** %data1, align 8, !dbg !36
  %arraydecay = getelementptr inbounds [10 x i8], [10 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !39
  store i8* %arraydecay, i8** %data1, align 8, !dbg !40
  %2 = load i8*, i8** %data1, align 8, !dbg !41
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 0, !dbg !41
  store i8 0, i8* %arrayidx, align 1, !dbg !42
  %3 = load i8*, i8** %data1, align 8, !dbg !43
  %4 = load i8**, i8*** %dataPtr1, align 8, !dbg !44
  store i8* %3, i8** %4, align 8, !dbg !45
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !46, metadata !DIExpression()), !dbg !48
  %5 = load i8**, i8*** %dataPtr2, align 8, !dbg !49
  %6 = load i8*, i8** %5, align 8, !dbg !50
  store i8* %6, i8** %data2, align 8, !dbg !48
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !51, metadata !DIExpression()), !dbg !53
  %7 = bitcast [11 x i8]* %source to i8*, !dbg !53
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %7, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_32_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !53
  call void @llvm.dbg.declare(metadata i64* %i, metadata !54, metadata !DIExpression()), !dbg !58
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !59, metadata !DIExpression()), !dbg !60
  %arraydecay3 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !61
  %call = call i64 @strlen(i8* %arraydecay3) #6, !dbg !62
  store i64 %call, i64* %sourceLen, align 8, !dbg !63
  store i64 0, i64* %i, align 8, !dbg !64
  br label %for.cond, !dbg !66

for.cond:                                         ; preds = %for.inc, %entry
  %8 = load i64, i64* %i, align 8, !dbg !67
  %9 = load i64, i64* %sourceLen, align 8, !dbg !69
  %add = add i64 %9, 1, !dbg !70
  %cmp = icmp ult i64 %8, %add, !dbg !71
  br i1 %cmp, label %for.body, label %for.end, !dbg !72

for.body:                                         ; preds = %for.cond
  %10 = load i64, i64* %i, align 8, !dbg !73
  %arrayidx4 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %10, !dbg !75
  %11 = load i8, i8* %arrayidx4, align 1, !dbg !75
  %12 = load i8*, i8** %data2, align 8, !dbg !76
  %13 = load i64, i64* %i, align 8, !dbg !77
  %arrayidx5 = getelementptr inbounds i8, i8* %12, i64 %13, !dbg !76
  store i8 %11, i8* %arrayidx5, align 1, !dbg !78
  br label %for.inc, !dbg !79

for.inc:                                          ; preds = %for.body
  %14 = load i64, i64* %i, align 8, !dbg !80
  %inc = add i64 %14, 1, !dbg !80
  store i64 %inc, i64* %i, align 8, !dbg !80
  br label %for.cond, !dbg !81, !llvm.loop !82

for.end:                                          ; preds = %for.cond
  %15 = load i8*, i8** %data2, align 8, !dbg !85
  call void @printLine(i8* %15), !dbg !86
  ret void, !dbg !87
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_32_good() #0 !dbg !88 {
entry:
  call void @goodG2B(), !dbg !89
  ret void, !dbg !90
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !91 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !95, metadata !DIExpression()), !dbg !96
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !97, metadata !DIExpression()), !dbg !98
  %call = call i64 @time(i64* null) #7, !dbg !99
  %conv = trunc i64 %call to i32, !dbg !100
  call void @srand(i32 %conv) #7, !dbg !101
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !102
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_32_good(), !dbg !103
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !104
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !105
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_32_bad(), !dbg !106
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !107
  ret i32 0, !dbg !108
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !109 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %data1 = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !110, metadata !DIExpression()), !dbg !111
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !112, metadata !DIExpression()), !dbg !113
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !113
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !114, metadata !DIExpression()), !dbg !115
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !115
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !116, metadata !DIExpression()), !dbg !117
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !118, metadata !DIExpression()), !dbg !119
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !120, metadata !DIExpression()), !dbg !122
  %0 = load i8**, i8*** %dataPtr1, align 8, !dbg !123
  %1 = load i8*, i8** %0, align 8, !dbg !124
  store i8* %1, i8** %data1, align 8, !dbg !122
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !125
  store i8* %arraydecay, i8** %data1, align 8, !dbg !126
  %2 = load i8*, i8** %data1, align 8, !dbg !127
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 0, !dbg !127
  store i8 0, i8* %arrayidx, align 1, !dbg !128
  %3 = load i8*, i8** %data1, align 8, !dbg !129
  %4 = load i8**, i8*** %dataPtr1, align 8, !dbg !130
  store i8* %3, i8** %4, align 8, !dbg !131
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !132, metadata !DIExpression()), !dbg !134
  %5 = load i8**, i8*** %dataPtr2, align 8, !dbg !135
  %6 = load i8*, i8** %5, align 8, !dbg !136
  store i8* %6, i8** %data2, align 8, !dbg !134
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !137, metadata !DIExpression()), !dbg !139
  %7 = bitcast [11 x i8]* %source to i8*, !dbg !139
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %7, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B.source, i32 0, i32 0), i64 11, i1 false), !dbg !139
  call void @llvm.dbg.declare(metadata i64* %i, metadata !140, metadata !DIExpression()), !dbg !141
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !142, metadata !DIExpression()), !dbg !143
  %arraydecay3 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !144
  %call = call i64 @strlen(i8* %arraydecay3) #6, !dbg !145
  store i64 %call, i64* %sourceLen, align 8, !dbg !146
  store i64 0, i64* %i, align 8, !dbg !147
  br label %for.cond, !dbg !149

for.cond:                                         ; preds = %for.inc, %entry
  %8 = load i64, i64* %i, align 8, !dbg !150
  %9 = load i64, i64* %sourceLen, align 8, !dbg !152
  %add = add i64 %9, 1, !dbg !153
  %cmp = icmp ult i64 %8, %add, !dbg !154
  br i1 %cmp, label %for.body, label %for.end, !dbg !155

for.body:                                         ; preds = %for.cond
  %10 = load i64, i64* %i, align 8, !dbg !156
  %arrayidx4 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %10, !dbg !158
  %11 = load i8, i8* %arrayidx4, align 1, !dbg !158
  %12 = load i8*, i8** %data2, align 8, !dbg !159
  %13 = load i64, i64* %i, align 8, !dbg !160
  %arrayidx5 = getelementptr inbounds i8, i8* %12, i64 %13, !dbg !159
  store i8 %11, i8* %arrayidx5, align 1, !dbg !161
  br label %for.inc, !dbg !162

for.inc:                                          ; preds = %for.body
  %14 = load i64, i64* %i, align 8, !dbg !163
  %inc = add i64 %14, 1, !dbg !163
  store i64 %inc, i64* %i, align 8, !dbg !163
  br label %for.cond, !dbg !164, !llvm.loop !165

for.end:                                          ; preds = %for.cond
  %15 = load i8*, i8** %data2, align 8, !dbg !167
  call void @printLine(i8* %15), !dbg !168
  ret void, !dbg !169
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_32.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_32_bad", scope: !12, file: !12, line: 28, type: !13, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_32.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 30, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 30, column: 12, scope: !11)
!19 = !DILocalVariable(name: "dataPtr1", scope: !11, file: !12, line: 31, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!21 = !DILocation(line: 31, column: 13, scope: !11)
!22 = !DILocalVariable(name: "dataPtr2", scope: !11, file: !12, line: 32, type: !20)
!23 = !DILocation(line: 32, column: 13, scope: !11)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 33, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 80, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 10)
!28 = !DILocation(line: 33, column: 10, scope: !11)
!29 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 34, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 88, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 11)
!33 = !DILocation(line: 34, column: 10, scope: !11)
!34 = !DILocalVariable(name: "data", scope: !35, file: !12, line: 36, type: !16)
!35 = distinct !DILexicalBlock(scope: !11, file: !12, line: 35, column: 5)
!36 = !DILocation(line: 36, column: 16, scope: !35)
!37 = !DILocation(line: 36, column: 24, scope: !35)
!38 = !DILocation(line: 36, column: 23, scope: !35)
!39 = !DILocation(line: 39, column: 16, scope: !35)
!40 = !DILocation(line: 39, column: 14, scope: !35)
!41 = !DILocation(line: 40, column: 9, scope: !35)
!42 = !DILocation(line: 40, column: 17, scope: !35)
!43 = !DILocation(line: 41, column: 21, scope: !35)
!44 = !DILocation(line: 41, column: 10, scope: !35)
!45 = !DILocation(line: 41, column: 19, scope: !35)
!46 = !DILocalVariable(name: "data", scope: !47, file: !12, line: 44, type: !16)
!47 = distinct !DILexicalBlock(scope: !11, file: !12, line: 43, column: 5)
!48 = !DILocation(line: 44, column: 16, scope: !47)
!49 = !DILocation(line: 44, column: 24, scope: !47)
!50 = !DILocation(line: 44, column: 23, scope: !47)
!51 = !DILocalVariable(name: "source", scope: !52, file: !12, line: 46, type: !30)
!52 = distinct !DILexicalBlock(scope: !47, file: !12, line: 45, column: 9)
!53 = !DILocation(line: 46, column: 18, scope: !52)
!54 = !DILocalVariable(name: "i", scope: !52, file: !12, line: 47, type: !55)
!55 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !56, line: 46, baseType: !57)
!56 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!57 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!58 = !DILocation(line: 47, column: 20, scope: !52)
!59 = !DILocalVariable(name: "sourceLen", scope: !52, file: !12, line: 47, type: !55)
!60 = !DILocation(line: 47, column: 23, scope: !52)
!61 = !DILocation(line: 48, column: 32, scope: !52)
!62 = !DILocation(line: 48, column: 25, scope: !52)
!63 = !DILocation(line: 48, column: 23, scope: !52)
!64 = !DILocation(line: 51, column: 20, scope: !65)
!65 = distinct !DILexicalBlock(scope: !52, file: !12, line: 51, column: 13)
!66 = !DILocation(line: 51, column: 18, scope: !65)
!67 = !DILocation(line: 51, column: 25, scope: !68)
!68 = distinct !DILexicalBlock(scope: !65, file: !12, line: 51, column: 13)
!69 = !DILocation(line: 51, column: 29, scope: !68)
!70 = !DILocation(line: 51, column: 39, scope: !68)
!71 = !DILocation(line: 51, column: 27, scope: !68)
!72 = !DILocation(line: 51, column: 13, scope: !65)
!73 = !DILocation(line: 53, column: 34, scope: !74)
!74 = distinct !DILexicalBlock(scope: !68, file: !12, line: 52, column: 13)
!75 = !DILocation(line: 53, column: 27, scope: !74)
!76 = !DILocation(line: 53, column: 17, scope: !74)
!77 = !DILocation(line: 53, column: 22, scope: !74)
!78 = !DILocation(line: 53, column: 25, scope: !74)
!79 = !DILocation(line: 54, column: 13, scope: !74)
!80 = !DILocation(line: 51, column: 45, scope: !68)
!81 = !DILocation(line: 51, column: 13, scope: !68)
!82 = distinct !{!82, !72, !83, !84}
!83 = !DILocation(line: 54, column: 13, scope: !65)
!84 = !{!"llvm.loop.mustprogress"}
!85 = !DILocation(line: 55, column: 23, scope: !52)
!86 = !DILocation(line: 55, column: 13, scope: !52)
!87 = !DILocation(line: 58, column: 1, scope: !11)
!88 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_32_good", scope: !12, file: !12, line: 97, type: !13, scopeLine: 98, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!89 = !DILocation(line: 99, column: 5, scope: !88)
!90 = !DILocation(line: 100, column: 1, scope: !88)
!91 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 111, type: !92, scopeLine: 112, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!92 = !DISubroutineType(types: !93)
!93 = !{!94, !94, !20}
!94 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!95 = !DILocalVariable(name: "argc", arg: 1, scope: !91, file: !12, line: 111, type: !94)
!96 = !DILocation(line: 111, column: 14, scope: !91)
!97 = !DILocalVariable(name: "argv", arg: 2, scope: !91, file: !12, line: 111, type: !20)
!98 = !DILocation(line: 111, column: 27, scope: !91)
!99 = !DILocation(line: 114, column: 22, scope: !91)
!100 = !DILocation(line: 114, column: 12, scope: !91)
!101 = !DILocation(line: 114, column: 5, scope: !91)
!102 = !DILocation(line: 116, column: 5, scope: !91)
!103 = !DILocation(line: 117, column: 5, scope: !91)
!104 = !DILocation(line: 118, column: 5, scope: !91)
!105 = !DILocation(line: 121, column: 5, scope: !91)
!106 = !DILocation(line: 122, column: 5, scope: !91)
!107 = !DILocation(line: 123, column: 5, scope: !91)
!108 = !DILocation(line: 125, column: 5, scope: !91)
!109 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 65, type: !13, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!110 = !DILocalVariable(name: "data", scope: !109, file: !12, line: 67, type: !16)
!111 = !DILocation(line: 67, column: 12, scope: !109)
!112 = !DILocalVariable(name: "dataPtr1", scope: !109, file: !12, line: 68, type: !20)
!113 = !DILocation(line: 68, column: 13, scope: !109)
!114 = !DILocalVariable(name: "dataPtr2", scope: !109, file: !12, line: 69, type: !20)
!115 = !DILocation(line: 69, column: 13, scope: !109)
!116 = !DILocalVariable(name: "dataBadBuffer", scope: !109, file: !12, line: 70, type: !25)
!117 = !DILocation(line: 70, column: 10, scope: !109)
!118 = !DILocalVariable(name: "dataGoodBuffer", scope: !109, file: !12, line: 71, type: !30)
!119 = !DILocation(line: 71, column: 10, scope: !109)
!120 = !DILocalVariable(name: "data", scope: !121, file: !12, line: 73, type: !16)
!121 = distinct !DILexicalBlock(scope: !109, file: !12, line: 72, column: 5)
!122 = !DILocation(line: 73, column: 16, scope: !121)
!123 = !DILocation(line: 73, column: 24, scope: !121)
!124 = !DILocation(line: 73, column: 23, scope: !121)
!125 = !DILocation(line: 76, column: 16, scope: !121)
!126 = !DILocation(line: 76, column: 14, scope: !121)
!127 = !DILocation(line: 77, column: 9, scope: !121)
!128 = !DILocation(line: 77, column: 17, scope: !121)
!129 = !DILocation(line: 78, column: 21, scope: !121)
!130 = !DILocation(line: 78, column: 10, scope: !121)
!131 = !DILocation(line: 78, column: 19, scope: !121)
!132 = !DILocalVariable(name: "data", scope: !133, file: !12, line: 81, type: !16)
!133 = distinct !DILexicalBlock(scope: !109, file: !12, line: 80, column: 5)
!134 = !DILocation(line: 81, column: 16, scope: !133)
!135 = !DILocation(line: 81, column: 24, scope: !133)
!136 = !DILocation(line: 81, column: 23, scope: !133)
!137 = !DILocalVariable(name: "source", scope: !138, file: !12, line: 83, type: !30)
!138 = distinct !DILexicalBlock(scope: !133, file: !12, line: 82, column: 9)
!139 = !DILocation(line: 83, column: 18, scope: !138)
!140 = !DILocalVariable(name: "i", scope: !138, file: !12, line: 84, type: !55)
!141 = !DILocation(line: 84, column: 20, scope: !138)
!142 = !DILocalVariable(name: "sourceLen", scope: !138, file: !12, line: 84, type: !55)
!143 = !DILocation(line: 84, column: 23, scope: !138)
!144 = !DILocation(line: 85, column: 32, scope: !138)
!145 = !DILocation(line: 85, column: 25, scope: !138)
!146 = !DILocation(line: 85, column: 23, scope: !138)
!147 = !DILocation(line: 88, column: 20, scope: !148)
!148 = distinct !DILexicalBlock(scope: !138, file: !12, line: 88, column: 13)
!149 = !DILocation(line: 88, column: 18, scope: !148)
!150 = !DILocation(line: 88, column: 25, scope: !151)
!151 = distinct !DILexicalBlock(scope: !148, file: !12, line: 88, column: 13)
!152 = !DILocation(line: 88, column: 29, scope: !151)
!153 = !DILocation(line: 88, column: 39, scope: !151)
!154 = !DILocation(line: 88, column: 27, scope: !151)
!155 = !DILocation(line: 88, column: 13, scope: !148)
!156 = !DILocation(line: 90, column: 34, scope: !157)
!157 = distinct !DILexicalBlock(scope: !151, file: !12, line: 89, column: 13)
!158 = !DILocation(line: 90, column: 27, scope: !157)
!159 = !DILocation(line: 90, column: 17, scope: !157)
!160 = !DILocation(line: 90, column: 22, scope: !157)
!161 = !DILocation(line: 90, column: 25, scope: !157)
!162 = !DILocation(line: 91, column: 13, scope: !157)
!163 = !DILocation(line: 88, column: 45, scope: !151)
!164 = !DILocation(line: 88, column: 13, scope: !151)
!165 = distinct !{!165, !155, !166, !84}
!166 = !DILocation(line: 91, column: 13, scope: !148)
!167 = !DILocation(line: 92, column: 23, scope: !138)
!168 = !DILocation(line: 92, column: 13, scope: !138)
!169 = !DILocation(line: 95, column: 1, scope: !109)

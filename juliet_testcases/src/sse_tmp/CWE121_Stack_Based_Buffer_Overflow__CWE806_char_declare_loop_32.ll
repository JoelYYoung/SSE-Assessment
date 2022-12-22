; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_32.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_32_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %data1 = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !19, metadata !DIExpression()), !dbg !21
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !21
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !22, metadata !DIExpression()), !dbg !23
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !29
  store i8* %arraydecay, i8** %data, align 8, !dbg !30
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !31, metadata !DIExpression()), !dbg !33
  %0 = load i8**, i8*** %dataPtr1, align 8, !dbg !34
  %1 = load i8*, i8** %0, align 8, !dbg !35
  store i8* %1, i8** %data1, align 8, !dbg !33
  %2 = load i8*, i8** %data1, align 8, !dbg !36
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !37
  %3 = load i8*, i8** %data1, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !38
  store i8 0, i8* %arrayidx, align 1, !dbg !39
  %4 = load i8*, i8** %data1, align 8, !dbg !40
  %5 = load i8**, i8*** %dataPtr1, align 8, !dbg !41
  store i8* %4, i8** %5, align 8, !dbg !42
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !43, metadata !DIExpression()), !dbg !45
  %6 = load i8**, i8*** %dataPtr2, align 8, !dbg !46
  %7 = load i8*, i8** %6, align 8, !dbg !47
  store i8* %7, i8** %data2, align 8, !dbg !45
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !48, metadata !DIExpression()), !dbg !53
  %8 = bitcast [50 x i8]* %dest to i8*, !dbg !53
  call void @llvm.memset.p0i8.i64(i8* align 16 %8, i8 0, i64 50, i1 false), !dbg !53
  call void @llvm.dbg.declare(metadata i64* %i, metadata !54, metadata !DIExpression()), !dbg !58
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !59, metadata !DIExpression()), !dbg !60
  %9 = load i8*, i8** %data2, align 8, !dbg !61
  %call = call i64 @strlen(i8* %9) #6, !dbg !62
  store i64 %call, i64* %dataLen, align 8, !dbg !63
  store i64 0, i64* %i, align 8, !dbg !64
  br label %for.cond, !dbg !66

for.cond:                                         ; preds = %for.inc, %entry
  %10 = load i64, i64* %i, align 8, !dbg !67
  %11 = load i64, i64* %dataLen, align 8, !dbg !69
  %cmp = icmp ult i64 %10, %11, !dbg !70
  br i1 %cmp, label %for.body, label %for.end, !dbg !71

for.body:                                         ; preds = %for.cond
  %12 = load i8*, i8** %data2, align 8, !dbg !72
  %13 = load i64, i64* %i, align 8, !dbg !74
  %arrayidx3 = getelementptr inbounds i8, i8* %12, i64 %13, !dbg !72
  %14 = load i8, i8* %arrayidx3, align 1, !dbg !72
  %15 = load i64, i64* %i, align 8, !dbg !75
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %15, !dbg !76
  store i8 %14, i8* %arrayidx4, align 1, !dbg !77
  br label %for.inc, !dbg !78

for.inc:                                          ; preds = %for.body
  %16 = load i64, i64* %i, align 8, !dbg !79
  %inc = add i64 %16, 1, !dbg !79
  store i64 %inc, i64* %i, align 8, !dbg !79
  br label %for.cond, !dbg !80, !llvm.loop !81

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !84
  store i8 0, i8* %arrayidx5, align 1, !dbg !85
  %17 = load i8*, i8** %data2, align 8, !dbg !86
  call void @printLine(i8* %17), !dbg !87
  ret void, !dbg !88
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_32_good() #0 !dbg !89 {
entry:
  call void @goodG2B(), !dbg !90
  ret void, !dbg !91
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !92 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !96, metadata !DIExpression()), !dbg !97
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !98, metadata !DIExpression()), !dbg !99
  %call = call i64 @time(i64* null) #7, !dbg !100
  %conv = trunc i64 %call to i32, !dbg !101
  call void @srand(i32 %conv) #7, !dbg !102
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !103
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_32_good(), !dbg !104
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !105
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !106
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_32_bad(), !dbg !107
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !108
  ret i32 0, !dbg !109
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !110 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %data1 = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !111, metadata !DIExpression()), !dbg !112
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !113, metadata !DIExpression()), !dbg !114
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !114
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !115, metadata !DIExpression()), !dbg !116
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !116
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !117, metadata !DIExpression()), !dbg !118
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !119
  store i8* %arraydecay, i8** %data, align 8, !dbg !120
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !121, metadata !DIExpression()), !dbg !123
  %0 = load i8**, i8*** %dataPtr1, align 8, !dbg !124
  %1 = load i8*, i8** %0, align 8, !dbg !125
  store i8* %1, i8** %data1, align 8, !dbg !123
  %2 = load i8*, i8** %data1, align 8, !dbg !126
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !127
  %3 = load i8*, i8** %data1, align 8, !dbg !128
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !128
  store i8 0, i8* %arrayidx, align 1, !dbg !129
  %4 = load i8*, i8** %data1, align 8, !dbg !130
  %5 = load i8**, i8*** %dataPtr1, align 8, !dbg !131
  store i8* %4, i8** %5, align 8, !dbg !132
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !133, metadata !DIExpression()), !dbg !135
  %6 = load i8**, i8*** %dataPtr2, align 8, !dbg !136
  %7 = load i8*, i8** %6, align 8, !dbg !137
  store i8* %7, i8** %data2, align 8, !dbg !135
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !138, metadata !DIExpression()), !dbg !140
  %8 = bitcast [50 x i8]* %dest to i8*, !dbg !140
  call void @llvm.memset.p0i8.i64(i8* align 16 %8, i8 0, i64 50, i1 false), !dbg !140
  call void @llvm.dbg.declare(metadata i64* %i, metadata !141, metadata !DIExpression()), !dbg !142
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !143, metadata !DIExpression()), !dbg !144
  %9 = load i8*, i8** %data2, align 8, !dbg !145
  %call = call i64 @strlen(i8* %9) #6, !dbg !146
  store i64 %call, i64* %dataLen, align 8, !dbg !147
  store i64 0, i64* %i, align 8, !dbg !148
  br label %for.cond, !dbg !150

for.cond:                                         ; preds = %for.inc, %entry
  %10 = load i64, i64* %i, align 8, !dbg !151
  %11 = load i64, i64* %dataLen, align 8, !dbg !153
  %cmp = icmp ult i64 %10, %11, !dbg !154
  br i1 %cmp, label %for.body, label %for.end, !dbg !155

for.body:                                         ; preds = %for.cond
  %12 = load i8*, i8** %data2, align 8, !dbg !156
  %13 = load i64, i64* %i, align 8, !dbg !158
  %arrayidx3 = getelementptr inbounds i8, i8* %12, i64 %13, !dbg !156
  %14 = load i8, i8* %arrayidx3, align 1, !dbg !156
  %15 = load i64, i64* %i, align 8, !dbg !159
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %15, !dbg !160
  store i8 %14, i8* %arrayidx4, align 1, !dbg !161
  br label %for.inc, !dbg !162

for.inc:                                          ; preds = %for.body
  %16 = load i64, i64* %i, align 8, !dbg !163
  %inc = add i64 %16, 1, !dbg !163
  store i64 %inc, i64* %i, align 8, !dbg !163
  br label %for.cond, !dbg !164, !llvm.loop !165

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !167
  store i8 0, i8* %arrayidx5, align 1, !dbg !168
  %17 = load i8*, i8** %data2, align 8, !dbg !169
  call void @printLine(i8* %17), !dbg !170
  ret void, !dbg !171
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_32.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_32_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_32.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 25, column: 12, scope: !11)
!19 = !DILocalVariable(name: "dataPtr1", scope: !11, file: !12, line: 26, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!21 = !DILocation(line: 26, column: 13, scope: !11)
!22 = !DILocalVariable(name: "dataPtr2", scope: !11, file: !12, line: 27, type: !20)
!23 = !DILocation(line: 27, column: 13, scope: !11)
!24 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 28, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 800, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 28, column: 10, scope: !11)
!29 = !DILocation(line: 29, column: 12, scope: !11)
!30 = !DILocation(line: 29, column: 10, scope: !11)
!31 = !DILocalVariable(name: "data", scope: !32, file: !12, line: 31, type: !16)
!32 = distinct !DILexicalBlock(scope: !11, file: !12, line: 30, column: 5)
!33 = !DILocation(line: 31, column: 16, scope: !32)
!34 = !DILocation(line: 31, column: 24, scope: !32)
!35 = !DILocation(line: 31, column: 23, scope: !32)
!36 = !DILocation(line: 33, column: 16, scope: !32)
!37 = !DILocation(line: 33, column: 9, scope: !32)
!38 = !DILocation(line: 34, column: 9, scope: !32)
!39 = !DILocation(line: 34, column: 21, scope: !32)
!40 = !DILocation(line: 35, column: 21, scope: !32)
!41 = !DILocation(line: 35, column: 10, scope: !32)
!42 = !DILocation(line: 35, column: 19, scope: !32)
!43 = !DILocalVariable(name: "data", scope: !44, file: !12, line: 38, type: !16)
!44 = distinct !DILexicalBlock(scope: !11, file: !12, line: 37, column: 5)
!45 = !DILocation(line: 38, column: 16, scope: !44)
!46 = !DILocation(line: 38, column: 24, scope: !44)
!47 = !DILocation(line: 38, column: 23, scope: !44)
!48 = !DILocalVariable(name: "dest", scope: !49, file: !12, line: 40, type: !50)
!49 = distinct !DILexicalBlock(scope: !44, file: !12, line: 39, column: 9)
!50 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 400, elements: !51)
!51 = !{!52}
!52 = !DISubrange(count: 50)
!53 = !DILocation(line: 40, column: 18, scope: !49)
!54 = !DILocalVariable(name: "i", scope: !49, file: !12, line: 41, type: !55)
!55 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !56, line: 46, baseType: !57)
!56 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!57 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!58 = !DILocation(line: 41, column: 20, scope: !49)
!59 = !DILocalVariable(name: "dataLen", scope: !49, file: !12, line: 41, type: !55)
!60 = !DILocation(line: 41, column: 23, scope: !49)
!61 = !DILocation(line: 42, column: 30, scope: !49)
!62 = !DILocation(line: 42, column: 23, scope: !49)
!63 = !DILocation(line: 42, column: 21, scope: !49)
!64 = !DILocation(line: 44, column: 20, scope: !65)
!65 = distinct !DILexicalBlock(scope: !49, file: !12, line: 44, column: 13)
!66 = !DILocation(line: 44, column: 18, scope: !65)
!67 = !DILocation(line: 44, column: 25, scope: !68)
!68 = distinct !DILexicalBlock(scope: !65, file: !12, line: 44, column: 13)
!69 = !DILocation(line: 44, column: 29, scope: !68)
!70 = !DILocation(line: 44, column: 27, scope: !68)
!71 = !DILocation(line: 44, column: 13, scope: !65)
!72 = !DILocation(line: 46, column: 27, scope: !73)
!73 = distinct !DILexicalBlock(scope: !68, file: !12, line: 45, column: 13)
!74 = !DILocation(line: 46, column: 32, scope: !73)
!75 = !DILocation(line: 46, column: 22, scope: !73)
!76 = !DILocation(line: 46, column: 17, scope: !73)
!77 = !DILocation(line: 46, column: 25, scope: !73)
!78 = !DILocation(line: 47, column: 13, scope: !73)
!79 = !DILocation(line: 44, column: 39, scope: !68)
!80 = !DILocation(line: 44, column: 13, scope: !68)
!81 = distinct !{!81, !71, !82, !83}
!82 = !DILocation(line: 47, column: 13, scope: !65)
!83 = !{!"llvm.loop.mustprogress"}
!84 = !DILocation(line: 48, column: 13, scope: !49)
!85 = !DILocation(line: 48, column: 24, scope: !49)
!86 = !DILocation(line: 49, column: 23, scope: !49)
!87 = !DILocation(line: 49, column: 13, scope: !49)
!88 = !DILocation(line: 52, column: 1, scope: !11)
!89 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_32_good", scope: !12, file: !12, line: 90, type: !13, scopeLine: 91, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!90 = !DILocation(line: 92, column: 5, scope: !89)
!91 = !DILocation(line: 93, column: 1, scope: !89)
!92 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 104, type: !93, scopeLine: 105, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!93 = !DISubroutineType(types: !94)
!94 = !{!95, !95, !20}
!95 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!96 = !DILocalVariable(name: "argc", arg: 1, scope: !92, file: !12, line: 104, type: !95)
!97 = !DILocation(line: 104, column: 14, scope: !92)
!98 = !DILocalVariable(name: "argv", arg: 2, scope: !92, file: !12, line: 104, type: !20)
!99 = !DILocation(line: 104, column: 27, scope: !92)
!100 = !DILocation(line: 107, column: 22, scope: !92)
!101 = !DILocation(line: 107, column: 12, scope: !92)
!102 = !DILocation(line: 107, column: 5, scope: !92)
!103 = !DILocation(line: 109, column: 5, scope: !92)
!104 = !DILocation(line: 110, column: 5, scope: !92)
!105 = !DILocation(line: 111, column: 5, scope: !92)
!106 = !DILocation(line: 114, column: 5, scope: !92)
!107 = !DILocation(line: 115, column: 5, scope: !92)
!108 = !DILocation(line: 116, column: 5, scope: !92)
!109 = !DILocation(line: 118, column: 5, scope: !92)
!110 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 59, type: !13, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!111 = !DILocalVariable(name: "data", scope: !110, file: !12, line: 61, type: !16)
!112 = !DILocation(line: 61, column: 12, scope: !110)
!113 = !DILocalVariable(name: "dataPtr1", scope: !110, file: !12, line: 62, type: !20)
!114 = !DILocation(line: 62, column: 13, scope: !110)
!115 = !DILocalVariable(name: "dataPtr2", scope: !110, file: !12, line: 63, type: !20)
!116 = !DILocation(line: 63, column: 13, scope: !110)
!117 = !DILocalVariable(name: "dataBuffer", scope: !110, file: !12, line: 64, type: !25)
!118 = !DILocation(line: 64, column: 10, scope: !110)
!119 = !DILocation(line: 65, column: 12, scope: !110)
!120 = !DILocation(line: 65, column: 10, scope: !110)
!121 = !DILocalVariable(name: "data", scope: !122, file: !12, line: 67, type: !16)
!122 = distinct !DILexicalBlock(scope: !110, file: !12, line: 66, column: 5)
!123 = !DILocation(line: 67, column: 16, scope: !122)
!124 = !DILocation(line: 67, column: 24, scope: !122)
!125 = !DILocation(line: 67, column: 23, scope: !122)
!126 = !DILocation(line: 69, column: 16, scope: !122)
!127 = !DILocation(line: 69, column: 9, scope: !122)
!128 = !DILocation(line: 70, column: 9, scope: !122)
!129 = !DILocation(line: 70, column: 20, scope: !122)
!130 = !DILocation(line: 71, column: 21, scope: !122)
!131 = !DILocation(line: 71, column: 10, scope: !122)
!132 = !DILocation(line: 71, column: 19, scope: !122)
!133 = !DILocalVariable(name: "data", scope: !134, file: !12, line: 74, type: !16)
!134 = distinct !DILexicalBlock(scope: !110, file: !12, line: 73, column: 5)
!135 = !DILocation(line: 74, column: 16, scope: !134)
!136 = !DILocation(line: 74, column: 24, scope: !134)
!137 = !DILocation(line: 74, column: 23, scope: !134)
!138 = !DILocalVariable(name: "dest", scope: !139, file: !12, line: 76, type: !50)
!139 = distinct !DILexicalBlock(scope: !134, file: !12, line: 75, column: 9)
!140 = !DILocation(line: 76, column: 18, scope: !139)
!141 = !DILocalVariable(name: "i", scope: !139, file: !12, line: 77, type: !55)
!142 = !DILocation(line: 77, column: 20, scope: !139)
!143 = !DILocalVariable(name: "dataLen", scope: !139, file: !12, line: 77, type: !55)
!144 = !DILocation(line: 77, column: 23, scope: !139)
!145 = !DILocation(line: 78, column: 30, scope: !139)
!146 = !DILocation(line: 78, column: 23, scope: !139)
!147 = !DILocation(line: 78, column: 21, scope: !139)
!148 = !DILocation(line: 80, column: 20, scope: !149)
!149 = distinct !DILexicalBlock(scope: !139, file: !12, line: 80, column: 13)
!150 = !DILocation(line: 80, column: 18, scope: !149)
!151 = !DILocation(line: 80, column: 25, scope: !152)
!152 = distinct !DILexicalBlock(scope: !149, file: !12, line: 80, column: 13)
!153 = !DILocation(line: 80, column: 29, scope: !152)
!154 = !DILocation(line: 80, column: 27, scope: !152)
!155 = !DILocation(line: 80, column: 13, scope: !149)
!156 = !DILocation(line: 82, column: 27, scope: !157)
!157 = distinct !DILexicalBlock(scope: !152, file: !12, line: 81, column: 13)
!158 = !DILocation(line: 82, column: 32, scope: !157)
!159 = !DILocation(line: 82, column: 22, scope: !157)
!160 = !DILocation(line: 82, column: 17, scope: !157)
!161 = !DILocation(line: 82, column: 25, scope: !157)
!162 = !DILocation(line: 83, column: 13, scope: !157)
!163 = !DILocation(line: 80, column: 39, scope: !152)
!164 = !DILocation(line: 80, column: 13, scope: !152)
!165 = distinct !{!165, !155, !166, !83}
!166 = !DILocation(line: 83, column: 13, scope: !149)
!167 = !DILocation(line: 84, column: 13, scope: !139)
!168 = !DILocation(line: 84, column: 24, scope: !139)
!169 = !DILocation(line: 85, column: 23, scope: !139)
!170 = !DILocation(line: 85, column: 13, scope: !139)
!171 = !DILocation(line: 88, column: 1, scope: !110)

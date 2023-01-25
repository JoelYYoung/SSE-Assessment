; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_loop_12.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_loop_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_alloca_loop_12_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = alloca i8, i64 50, align 16, !dbg !21
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !20
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !22, metadata !DIExpression()), !dbg !23
  %1 = alloca i8, i64 100, align 16, !dbg !24
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !23
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !25
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !26
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !27
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !27
  store i8 0, i8* %arrayidx, align 1, !dbg !28
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 65, i64 99, i1 false), !dbg !30
  %5 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !31
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !31
  store i8 0, i8* %arrayidx1, align 1, !dbg !32
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !33
  %tobool = icmp ne i32 %call, 0, !dbg !33
  br i1 %tobool, label %if.then, label %if.else, !dbg !35

if.then:                                          ; preds = %entry
  %6 = load i8*, i8** %dataBadBuffer, align 8, !dbg !36
  store i8* %6, i8** %data, align 8, !dbg !38
  br label %if.end, !dbg !39

if.else:                                          ; preds = %entry
  %7 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !40
  store i8* %7, i8** %data, align 8, !dbg !42
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !43, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !49, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !51, metadata !DIExpression()), !dbg !55
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !56
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !56
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !57
  store i8 0, i8* %arrayidx2, align 1, !dbg !58
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !59
  %call4 = call i64 @strlen(i8* %arraydecay3) #6, !dbg !60
  store i64 %call4, i64* %destLen, align 8, !dbg !61
  store i64 0, i64* %i, align 8, !dbg !62
  br label %for.cond, !dbg !64

for.cond:                                         ; preds = %for.inc, %if.end
  %8 = load i64, i64* %i, align 8, !dbg !65
  %9 = load i64, i64* %destLen, align 8, !dbg !67
  %cmp = icmp ult i64 %8, %9, !dbg !68
  br i1 %cmp, label %for.body, label %for.end, !dbg !69

for.body:                                         ; preds = %for.cond
  %10 = load i8*, i8** %data, align 8, !dbg !70
  %11 = load i64, i64* %i, align 8, !dbg !72
  %arrayidx5 = getelementptr inbounds i8, i8* %10, i64 %11, !dbg !70
  %12 = load i8, i8* %arrayidx5, align 1, !dbg !70
  %13 = load i64, i64* %i, align 8, !dbg !73
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %13, !dbg !74
  store i8 %12, i8* %arrayidx6, align 1, !dbg !75
  br label %for.inc, !dbg !76

for.inc:                                          ; preds = %for.body
  %14 = load i64, i64* %i, align 8, !dbg !77
  %inc = add i64 %14, 1, !dbg !77
  store i64 %inc, i64* %i, align 8, !dbg !77
  br label %for.cond, !dbg !78, !llvm.loop !79

for.end:                                          ; preds = %for.cond
  %arrayidx7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !82
  store i8 0, i8* %arrayidx7, align 1, !dbg !83
  %arraydecay8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !84
  call void @printLine(i8* %arraydecay8), !dbg !85
  ret void, !dbg !86
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local i32 @globalReturnsTrueOrFalse(...) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_alloca_loop_12_good() #0 !dbg !87 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !95, metadata !DIExpression()), !dbg !96
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !97, metadata !DIExpression()), !dbg !98
  %call = call i64 @time(i64* null) #7, !dbg !99
  %conv = trunc i64 %call to i32, !dbg !100
  call void @srand(i32 %conv) #7, !dbg !101
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !102
  call void @CWE126_Buffer_Overread__char_alloca_loop_12_good(), !dbg !103
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !104
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !105
  call void @CWE126_Buffer_Overread__char_alloca_loop_12_bad(), !dbg !106
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
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !110, metadata !DIExpression()), !dbg !111
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !112, metadata !DIExpression()), !dbg !113
  %0 = alloca i8, i64 50, align 16, !dbg !114
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !113
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !115, metadata !DIExpression()), !dbg !116
  %1 = alloca i8, i64 100, align 16, !dbg !117
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !116
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !118
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !119
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !120
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !120
  store i8 0, i8* %arrayidx, align 1, !dbg !121
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !122
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 65, i64 99, i1 false), !dbg !123
  %5 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !124
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !124
  store i8 0, i8* %arrayidx1, align 1, !dbg !125
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !126
  %tobool = icmp ne i32 %call, 0, !dbg !126
  br i1 %tobool, label %if.then, label %if.else, !dbg !128

if.then:                                          ; preds = %entry
  %6 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !129
  store i8* %6, i8** %data, align 8, !dbg !131
  br label %if.end, !dbg !132

if.else:                                          ; preds = %entry
  %7 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !133
  store i8* %7, i8** %data, align 8, !dbg !135
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !136, metadata !DIExpression()), !dbg !138
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !139, metadata !DIExpression()), !dbg !140
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !141, metadata !DIExpression()), !dbg !142
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !143
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !143
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !144
  store i8 0, i8* %arrayidx2, align 1, !dbg !145
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !146
  %call4 = call i64 @strlen(i8* %arraydecay3) #6, !dbg !147
  store i64 %call4, i64* %destLen, align 8, !dbg !148
  store i64 0, i64* %i, align 8, !dbg !149
  br label %for.cond, !dbg !151

for.cond:                                         ; preds = %for.inc, %if.end
  %8 = load i64, i64* %i, align 8, !dbg !152
  %9 = load i64, i64* %destLen, align 8, !dbg !154
  %cmp = icmp ult i64 %8, %9, !dbg !155
  br i1 %cmp, label %for.body, label %for.end, !dbg !156

for.body:                                         ; preds = %for.cond
  %10 = load i8*, i8** %data, align 8, !dbg !157
  %11 = load i64, i64* %i, align 8, !dbg !159
  %arrayidx5 = getelementptr inbounds i8, i8* %10, i64 %11, !dbg !157
  %12 = load i8, i8* %arrayidx5, align 1, !dbg !157
  %13 = load i64, i64* %i, align 8, !dbg !160
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %13, !dbg !161
  store i8 %12, i8* %arrayidx6, align 1, !dbg !162
  br label %for.inc, !dbg !163

for.inc:                                          ; preds = %for.body
  %14 = load i64, i64* %i, align 8, !dbg !164
  %inc = add i64 %14, 1, !dbg !164
  store i64 %inc, i64* %i, align 8, !dbg !164
  br label %for.cond, !dbg !165, !llvm.loop !166

for.end:                                          ; preds = %for.cond
  %arrayidx7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !168
  store i8 0, i8* %arrayidx7, align 1, !dbg !169
  %arraydecay8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !170
  call void @printLine(i8* %arraydecay8), !dbg !171
  ret void, !dbg !172
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_loop_12.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_loop_12_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_loop_12.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 25, type: !4)
!18 = !DILocation(line: 25, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 26, type: !4)
!20 = !DILocation(line: 26, column: 12, scope: !13)
!21 = !DILocation(line: 26, column: 36, scope: !13)
!22 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 27, type: !4)
!23 = !DILocation(line: 27, column: 12, scope: !13)
!24 = !DILocation(line: 27, column: 37, scope: !13)
!25 = !DILocation(line: 28, column: 12, scope: !13)
!26 = !DILocation(line: 28, column: 5, scope: !13)
!27 = !DILocation(line: 29, column: 5, scope: !13)
!28 = !DILocation(line: 29, column: 25, scope: !13)
!29 = !DILocation(line: 30, column: 12, scope: !13)
!30 = !DILocation(line: 30, column: 5, scope: !13)
!31 = !DILocation(line: 31, column: 5, scope: !13)
!32 = !DILocation(line: 31, column: 27, scope: !13)
!33 = !DILocation(line: 32, column: 8, scope: !34)
!34 = distinct !DILexicalBlock(scope: !13, file: !14, line: 32, column: 8)
!35 = !DILocation(line: 32, column: 8, scope: !13)
!36 = !DILocation(line: 35, column: 16, scope: !37)
!37 = distinct !DILexicalBlock(scope: !34, file: !14, line: 33, column: 5)
!38 = !DILocation(line: 35, column: 14, scope: !37)
!39 = !DILocation(line: 36, column: 5, scope: !37)
!40 = !DILocation(line: 40, column: 16, scope: !41)
!41 = distinct !DILexicalBlock(scope: !34, file: !14, line: 38, column: 5)
!42 = !DILocation(line: 40, column: 14, scope: !41)
!43 = !DILocalVariable(name: "i", scope: !44, file: !14, line: 43, type: !45)
!44 = distinct !DILexicalBlock(scope: !13, file: !14, line: 42, column: 5)
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !46, line: 46, baseType: !47)
!46 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!47 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!48 = !DILocation(line: 43, column: 16, scope: !44)
!49 = !DILocalVariable(name: "destLen", scope: !44, file: !14, line: 43, type: !45)
!50 = !DILocation(line: 43, column: 19, scope: !44)
!51 = !DILocalVariable(name: "dest", scope: !44, file: !14, line: 44, type: !52)
!52 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !53)
!53 = !{!54}
!54 = !DISubrange(count: 100)
!55 = !DILocation(line: 44, column: 14, scope: !44)
!56 = !DILocation(line: 45, column: 9, scope: !44)
!57 = !DILocation(line: 46, column: 9, scope: !44)
!58 = !DILocation(line: 46, column: 21, scope: !44)
!59 = !DILocation(line: 47, column: 26, scope: !44)
!60 = !DILocation(line: 47, column: 19, scope: !44)
!61 = !DILocation(line: 47, column: 17, scope: !44)
!62 = !DILocation(line: 50, column: 16, scope: !63)
!63 = distinct !DILexicalBlock(scope: !44, file: !14, line: 50, column: 9)
!64 = !DILocation(line: 50, column: 14, scope: !63)
!65 = !DILocation(line: 50, column: 21, scope: !66)
!66 = distinct !DILexicalBlock(scope: !63, file: !14, line: 50, column: 9)
!67 = !DILocation(line: 50, column: 25, scope: !66)
!68 = !DILocation(line: 50, column: 23, scope: !66)
!69 = !DILocation(line: 50, column: 9, scope: !63)
!70 = !DILocation(line: 52, column: 23, scope: !71)
!71 = distinct !DILexicalBlock(scope: !66, file: !14, line: 51, column: 9)
!72 = !DILocation(line: 52, column: 28, scope: !71)
!73 = !DILocation(line: 52, column: 18, scope: !71)
!74 = !DILocation(line: 52, column: 13, scope: !71)
!75 = !DILocation(line: 52, column: 21, scope: !71)
!76 = !DILocation(line: 53, column: 9, scope: !71)
!77 = !DILocation(line: 50, column: 35, scope: !66)
!78 = !DILocation(line: 50, column: 9, scope: !66)
!79 = distinct !{!79, !69, !80, !81}
!80 = !DILocation(line: 53, column: 9, scope: !63)
!81 = !{!"llvm.loop.mustprogress"}
!82 = !DILocation(line: 54, column: 9, scope: !44)
!83 = !DILocation(line: 54, column: 21, scope: !44)
!84 = !DILocation(line: 55, column: 19, scope: !44)
!85 = !DILocation(line: 55, column: 9, scope: !44)
!86 = !DILocation(line: 57, column: 1, scope: !13)
!87 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_loop_12_good", scope: !14, file: !14, line: 101, type: !15, scopeLine: 102, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DILocation(line: 103, column: 5, scope: !87)
!89 = !DILocation(line: 104, column: 1, scope: !87)
!90 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 116, type: !91, scopeLine: 117, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!91 = !DISubroutineType(types: !92)
!92 = !{!93, !93, !94}
!93 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!94 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!95 = !DILocalVariable(name: "argc", arg: 1, scope: !90, file: !14, line: 116, type: !93)
!96 = !DILocation(line: 116, column: 14, scope: !90)
!97 = !DILocalVariable(name: "argv", arg: 2, scope: !90, file: !14, line: 116, type: !94)
!98 = !DILocation(line: 116, column: 27, scope: !90)
!99 = !DILocation(line: 119, column: 22, scope: !90)
!100 = !DILocation(line: 119, column: 12, scope: !90)
!101 = !DILocation(line: 119, column: 5, scope: !90)
!102 = !DILocation(line: 121, column: 5, scope: !90)
!103 = !DILocation(line: 122, column: 5, scope: !90)
!104 = !DILocation(line: 123, column: 5, scope: !90)
!105 = !DILocation(line: 126, column: 5, scope: !90)
!106 = !DILocation(line: 127, column: 5, scope: !90)
!107 = !DILocation(line: 128, column: 5, scope: !90)
!108 = !DILocation(line: 130, column: 5, scope: !90)
!109 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 65, type: !15, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!110 = !DILocalVariable(name: "data", scope: !109, file: !14, line: 67, type: !4)
!111 = !DILocation(line: 67, column: 12, scope: !109)
!112 = !DILocalVariable(name: "dataBadBuffer", scope: !109, file: !14, line: 68, type: !4)
!113 = !DILocation(line: 68, column: 12, scope: !109)
!114 = !DILocation(line: 68, column: 36, scope: !109)
!115 = !DILocalVariable(name: "dataGoodBuffer", scope: !109, file: !14, line: 69, type: !4)
!116 = !DILocation(line: 69, column: 12, scope: !109)
!117 = !DILocation(line: 69, column: 37, scope: !109)
!118 = !DILocation(line: 70, column: 12, scope: !109)
!119 = !DILocation(line: 70, column: 5, scope: !109)
!120 = !DILocation(line: 71, column: 5, scope: !109)
!121 = !DILocation(line: 71, column: 25, scope: !109)
!122 = !DILocation(line: 72, column: 12, scope: !109)
!123 = !DILocation(line: 72, column: 5, scope: !109)
!124 = !DILocation(line: 73, column: 5, scope: !109)
!125 = !DILocation(line: 73, column: 27, scope: !109)
!126 = !DILocation(line: 74, column: 8, scope: !127)
!127 = distinct !DILexicalBlock(scope: !109, file: !14, line: 74, column: 8)
!128 = !DILocation(line: 74, column: 8, scope: !109)
!129 = !DILocation(line: 77, column: 16, scope: !130)
!130 = distinct !DILexicalBlock(scope: !127, file: !14, line: 75, column: 5)
!131 = !DILocation(line: 77, column: 14, scope: !130)
!132 = !DILocation(line: 78, column: 5, scope: !130)
!133 = !DILocation(line: 82, column: 16, scope: !134)
!134 = distinct !DILexicalBlock(scope: !127, file: !14, line: 80, column: 5)
!135 = !DILocation(line: 82, column: 14, scope: !134)
!136 = !DILocalVariable(name: "i", scope: !137, file: !14, line: 85, type: !45)
!137 = distinct !DILexicalBlock(scope: !109, file: !14, line: 84, column: 5)
!138 = !DILocation(line: 85, column: 16, scope: !137)
!139 = !DILocalVariable(name: "destLen", scope: !137, file: !14, line: 85, type: !45)
!140 = !DILocation(line: 85, column: 19, scope: !137)
!141 = !DILocalVariable(name: "dest", scope: !137, file: !14, line: 86, type: !52)
!142 = !DILocation(line: 86, column: 14, scope: !137)
!143 = !DILocation(line: 87, column: 9, scope: !137)
!144 = !DILocation(line: 88, column: 9, scope: !137)
!145 = !DILocation(line: 88, column: 21, scope: !137)
!146 = !DILocation(line: 89, column: 26, scope: !137)
!147 = !DILocation(line: 89, column: 19, scope: !137)
!148 = !DILocation(line: 89, column: 17, scope: !137)
!149 = !DILocation(line: 92, column: 16, scope: !150)
!150 = distinct !DILexicalBlock(scope: !137, file: !14, line: 92, column: 9)
!151 = !DILocation(line: 92, column: 14, scope: !150)
!152 = !DILocation(line: 92, column: 21, scope: !153)
!153 = distinct !DILexicalBlock(scope: !150, file: !14, line: 92, column: 9)
!154 = !DILocation(line: 92, column: 25, scope: !153)
!155 = !DILocation(line: 92, column: 23, scope: !153)
!156 = !DILocation(line: 92, column: 9, scope: !150)
!157 = !DILocation(line: 94, column: 23, scope: !158)
!158 = distinct !DILexicalBlock(scope: !153, file: !14, line: 93, column: 9)
!159 = !DILocation(line: 94, column: 28, scope: !158)
!160 = !DILocation(line: 94, column: 18, scope: !158)
!161 = !DILocation(line: 94, column: 13, scope: !158)
!162 = !DILocation(line: 94, column: 21, scope: !158)
!163 = !DILocation(line: 95, column: 9, scope: !158)
!164 = !DILocation(line: 92, column: 35, scope: !153)
!165 = !DILocation(line: 92, column: 9, scope: !153)
!166 = distinct !{!166, !156, !167, !81}
!167 = !DILocation(line: 95, column: 9, scope: !150)
!168 = !DILocation(line: 96, column: 9, scope: !137)
!169 = !DILocation(line: 96, column: 21, scope: !137)
!170 = !DILocation(line: 97, column: 19, scope: !137)
!171 = !DILocation(line: 97, column: 9, scope: !137)
!172 = !DILocation(line: 99, column: 1, scope: !109)

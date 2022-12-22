; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_loop_31.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_loop_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_alloca_loop_31_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %dataCopy = alloca i8*, align 8
  %data2 = alloca i8*, align 8
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
  %6 = load i8*, i8** %dataBadBuffer, align 8, !dbg !33
  store i8* %6, i8** %data, align 8, !dbg !34
  call void @llvm.dbg.declare(metadata i8** %dataCopy, metadata !35, metadata !DIExpression()), !dbg !37
  %7 = load i8*, i8** %data, align 8, !dbg !38
  store i8* %7, i8** %dataCopy, align 8, !dbg !37
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !39, metadata !DIExpression()), !dbg !40
  %8 = load i8*, i8** %dataCopy, align 8, !dbg !41
  store i8* %8, i8** %data2, align 8, !dbg !40
  call void @llvm.dbg.declare(metadata i64* %i, metadata !42, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !48, metadata !DIExpression()), !dbg !49
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !50, metadata !DIExpression()), !dbg !54
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !55
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !55
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !56
  store i8 0, i8* %arrayidx3, align 1, !dbg !57
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !58
  %call = call i64 @strlen(i8* %arraydecay4) #6, !dbg !59
  store i64 %call, i64* %destLen, align 8, !dbg !60
  store i64 0, i64* %i, align 8, !dbg !61
  br label %for.cond, !dbg !63

for.cond:                                         ; preds = %for.inc, %entry
  %9 = load i64, i64* %i, align 8, !dbg !64
  %10 = load i64, i64* %destLen, align 8, !dbg !66
  %cmp = icmp ult i64 %9, %10, !dbg !67
  br i1 %cmp, label %for.body, label %for.end, !dbg !68

for.body:                                         ; preds = %for.cond
  %11 = load i8*, i8** %data2, align 8, !dbg !69
  %12 = load i64, i64* %i, align 8, !dbg !71
  %arrayidx5 = getelementptr inbounds i8, i8* %11, i64 %12, !dbg !69
  %13 = load i8, i8* %arrayidx5, align 1, !dbg !69
  %14 = load i64, i64* %i, align 8, !dbg !72
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %14, !dbg !73
  store i8 %13, i8* %arrayidx6, align 1, !dbg !74
  br label %for.inc, !dbg !75

for.inc:                                          ; preds = %for.body
  %15 = load i64, i64* %i, align 8, !dbg !76
  %inc = add i64 %15, 1, !dbg !76
  store i64 %inc, i64* %i, align 8, !dbg !76
  br label %for.cond, !dbg !77, !llvm.loop !78

for.end:                                          ; preds = %for.cond
  %arrayidx7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !81
  store i8 0, i8* %arrayidx7, align 1, !dbg !82
  %arraydecay8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !83
  call void @printLine(i8* %arraydecay8), !dbg !84
  ret void, !dbg !85
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_alloca_loop_31_good() #0 !dbg !86 {
entry:
  call void @goodG2B(), !dbg !87
  ret void, !dbg !88
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !89 {
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
  call void @CWE126_Buffer_Overread__char_alloca_loop_31_good(), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !103
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !104
  call void @CWE126_Buffer_Overread__char_alloca_loop_31_bad(), !dbg !105
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
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %dataCopy = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !109, metadata !DIExpression()), !dbg !110
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !111, metadata !DIExpression()), !dbg !112
  %0 = alloca i8, i64 50, align 16, !dbg !113
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !112
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !114, metadata !DIExpression()), !dbg !115
  %1 = alloca i8, i64 100, align 16, !dbg !116
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !115
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !117
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !118
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !119
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !119
  store i8 0, i8* %arrayidx, align 1, !dbg !120
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !121
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 65, i64 99, i1 false), !dbg !122
  %5 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !123
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !123
  store i8 0, i8* %arrayidx1, align 1, !dbg !124
  %6 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !125
  store i8* %6, i8** %data, align 8, !dbg !126
  call void @llvm.dbg.declare(metadata i8** %dataCopy, metadata !127, metadata !DIExpression()), !dbg !129
  %7 = load i8*, i8** %data, align 8, !dbg !130
  store i8* %7, i8** %dataCopy, align 8, !dbg !129
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !131, metadata !DIExpression()), !dbg !132
  %8 = load i8*, i8** %dataCopy, align 8, !dbg !133
  store i8* %8, i8** %data2, align 8, !dbg !132
  call void @llvm.dbg.declare(metadata i64* %i, metadata !134, metadata !DIExpression()), !dbg !136
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !137, metadata !DIExpression()), !dbg !138
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !139, metadata !DIExpression()), !dbg !140
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !141
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !141
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !142
  store i8 0, i8* %arrayidx3, align 1, !dbg !143
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !144
  %call = call i64 @strlen(i8* %arraydecay4) #6, !dbg !145
  store i64 %call, i64* %destLen, align 8, !dbg !146
  store i64 0, i64* %i, align 8, !dbg !147
  br label %for.cond, !dbg !149

for.cond:                                         ; preds = %for.inc, %entry
  %9 = load i64, i64* %i, align 8, !dbg !150
  %10 = load i64, i64* %destLen, align 8, !dbg !152
  %cmp = icmp ult i64 %9, %10, !dbg !153
  br i1 %cmp, label %for.body, label %for.end, !dbg !154

for.body:                                         ; preds = %for.cond
  %11 = load i8*, i8** %data2, align 8, !dbg !155
  %12 = load i64, i64* %i, align 8, !dbg !157
  %arrayidx5 = getelementptr inbounds i8, i8* %11, i64 %12, !dbg !155
  %13 = load i8, i8* %arrayidx5, align 1, !dbg !155
  %14 = load i64, i64* %i, align 8, !dbg !158
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %14, !dbg !159
  store i8 %13, i8* %arrayidx6, align 1, !dbg !160
  br label %for.inc, !dbg !161

for.inc:                                          ; preds = %for.body
  %15 = load i64, i64* %i, align 8, !dbg !162
  %inc = add i64 %15, 1, !dbg !162
  store i64 %inc, i64* %i, align 8, !dbg !162
  br label %for.cond, !dbg !163, !llvm.loop !164

for.end:                                          ; preds = %for.cond
  %arrayidx7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !166
  store i8 0, i8* %arrayidx7, align 1, !dbg !167
  %arraydecay8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !168
  call void @printLine(i8* %arraydecay8), !dbg !169
  ret void, !dbg !170
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
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_loop_31.c", directory: "/root/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_loop_31_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_loop_31.c", directory: "/root/SSE-Assessment")
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
!33 = !DILocation(line: 33, column: 12, scope: !13)
!34 = !DILocation(line: 33, column: 10, scope: !13)
!35 = !DILocalVariable(name: "dataCopy", scope: !36, file: !14, line: 35, type: !4)
!36 = distinct !DILexicalBlock(scope: !13, file: !14, line: 34, column: 5)
!37 = !DILocation(line: 35, column: 16, scope: !36)
!38 = !DILocation(line: 35, column: 27, scope: !36)
!39 = !DILocalVariable(name: "data", scope: !36, file: !14, line: 36, type: !4)
!40 = !DILocation(line: 36, column: 16, scope: !36)
!41 = !DILocation(line: 36, column: 23, scope: !36)
!42 = !DILocalVariable(name: "i", scope: !43, file: !14, line: 38, type: !44)
!43 = distinct !DILexicalBlock(scope: !36, file: !14, line: 37, column: 9)
!44 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !45, line: 46, baseType: !46)
!45 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!46 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!47 = !DILocation(line: 38, column: 20, scope: !43)
!48 = !DILocalVariable(name: "destLen", scope: !43, file: !14, line: 38, type: !44)
!49 = !DILocation(line: 38, column: 23, scope: !43)
!50 = !DILocalVariable(name: "dest", scope: !43, file: !14, line: 39, type: !51)
!51 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !52)
!52 = !{!53}
!53 = !DISubrange(count: 100)
!54 = !DILocation(line: 39, column: 18, scope: !43)
!55 = !DILocation(line: 40, column: 13, scope: !43)
!56 = !DILocation(line: 41, column: 13, scope: !43)
!57 = !DILocation(line: 41, column: 25, scope: !43)
!58 = !DILocation(line: 42, column: 30, scope: !43)
!59 = !DILocation(line: 42, column: 23, scope: !43)
!60 = !DILocation(line: 42, column: 21, scope: !43)
!61 = !DILocation(line: 45, column: 20, scope: !62)
!62 = distinct !DILexicalBlock(scope: !43, file: !14, line: 45, column: 13)
!63 = !DILocation(line: 45, column: 18, scope: !62)
!64 = !DILocation(line: 45, column: 25, scope: !65)
!65 = distinct !DILexicalBlock(scope: !62, file: !14, line: 45, column: 13)
!66 = !DILocation(line: 45, column: 29, scope: !65)
!67 = !DILocation(line: 45, column: 27, scope: !65)
!68 = !DILocation(line: 45, column: 13, scope: !62)
!69 = !DILocation(line: 47, column: 27, scope: !70)
!70 = distinct !DILexicalBlock(scope: !65, file: !14, line: 46, column: 13)
!71 = !DILocation(line: 47, column: 32, scope: !70)
!72 = !DILocation(line: 47, column: 22, scope: !70)
!73 = !DILocation(line: 47, column: 17, scope: !70)
!74 = !DILocation(line: 47, column: 25, scope: !70)
!75 = !DILocation(line: 48, column: 13, scope: !70)
!76 = !DILocation(line: 45, column: 39, scope: !65)
!77 = !DILocation(line: 45, column: 13, scope: !65)
!78 = distinct !{!78, !68, !79, !80}
!79 = !DILocation(line: 48, column: 13, scope: !62)
!80 = !{!"llvm.loop.mustprogress"}
!81 = !DILocation(line: 49, column: 13, scope: !43)
!82 = !DILocation(line: 49, column: 25, scope: !43)
!83 = !DILocation(line: 50, column: 23, scope: !43)
!84 = !DILocation(line: 50, column: 13, scope: !43)
!85 = !DILocation(line: 53, column: 1, scope: !13)
!86 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_loop_31_good", scope: !14, file: !14, line: 92, type: !15, scopeLine: 93, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!87 = !DILocation(line: 94, column: 5, scope: !86)
!88 = !DILocation(line: 95, column: 1, scope: !86)
!89 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 106, type: !90, scopeLine: 107, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!90 = !DISubroutineType(types: !91)
!91 = !{!92, !92, !93}
!92 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!93 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!94 = !DILocalVariable(name: "argc", arg: 1, scope: !89, file: !14, line: 106, type: !92)
!95 = !DILocation(line: 106, column: 14, scope: !89)
!96 = !DILocalVariable(name: "argv", arg: 2, scope: !89, file: !14, line: 106, type: !93)
!97 = !DILocation(line: 106, column: 27, scope: !89)
!98 = !DILocation(line: 109, column: 22, scope: !89)
!99 = !DILocation(line: 109, column: 12, scope: !89)
!100 = !DILocation(line: 109, column: 5, scope: !89)
!101 = !DILocation(line: 111, column: 5, scope: !89)
!102 = !DILocation(line: 112, column: 5, scope: !89)
!103 = !DILocation(line: 113, column: 5, scope: !89)
!104 = !DILocation(line: 116, column: 5, scope: !89)
!105 = !DILocation(line: 117, column: 5, scope: !89)
!106 = !DILocation(line: 118, column: 5, scope: !89)
!107 = !DILocation(line: 120, column: 5, scope: !89)
!108 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 60, type: !15, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!109 = !DILocalVariable(name: "data", scope: !108, file: !14, line: 62, type: !4)
!110 = !DILocation(line: 62, column: 12, scope: !108)
!111 = !DILocalVariable(name: "dataBadBuffer", scope: !108, file: !14, line: 63, type: !4)
!112 = !DILocation(line: 63, column: 12, scope: !108)
!113 = !DILocation(line: 63, column: 36, scope: !108)
!114 = !DILocalVariable(name: "dataGoodBuffer", scope: !108, file: !14, line: 64, type: !4)
!115 = !DILocation(line: 64, column: 12, scope: !108)
!116 = !DILocation(line: 64, column: 37, scope: !108)
!117 = !DILocation(line: 65, column: 12, scope: !108)
!118 = !DILocation(line: 65, column: 5, scope: !108)
!119 = !DILocation(line: 66, column: 5, scope: !108)
!120 = !DILocation(line: 66, column: 25, scope: !108)
!121 = !DILocation(line: 67, column: 12, scope: !108)
!122 = !DILocation(line: 67, column: 5, scope: !108)
!123 = !DILocation(line: 68, column: 5, scope: !108)
!124 = !DILocation(line: 68, column: 27, scope: !108)
!125 = !DILocation(line: 70, column: 12, scope: !108)
!126 = !DILocation(line: 70, column: 10, scope: !108)
!127 = !DILocalVariable(name: "dataCopy", scope: !128, file: !14, line: 72, type: !4)
!128 = distinct !DILexicalBlock(scope: !108, file: !14, line: 71, column: 5)
!129 = !DILocation(line: 72, column: 16, scope: !128)
!130 = !DILocation(line: 72, column: 27, scope: !128)
!131 = !DILocalVariable(name: "data", scope: !128, file: !14, line: 73, type: !4)
!132 = !DILocation(line: 73, column: 16, scope: !128)
!133 = !DILocation(line: 73, column: 23, scope: !128)
!134 = !DILocalVariable(name: "i", scope: !135, file: !14, line: 75, type: !44)
!135 = distinct !DILexicalBlock(scope: !128, file: !14, line: 74, column: 9)
!136 = !DILocation(line: 75, column: 20, scope: !135)
!137 = !DILocalVariable(name: "destLen", scope: !135, file: !14, line: 75, type: !44)
!138 = !DILocation(line: 75, column: 23, scope: !135)
!139 = !DILocalVariable(name: "dest", scope: !135, file: !14, line: 76, type: !51)
!140 = !DILocation(line: 76, column: 18, scope: !135)
!141 = !DILocation(line: 77, column: 13, scope: !135)
!142 = !DILocation(line: 78, column: 13, scope: !135)
!143 = !DILocation(line: 78, column: 25, scope: !135)
!144 = !DILocation(line: 79, column: 30, scope: !135)
!145 = !DILocation(line: 79, column: 23, scope: !135)
!146 = !DILocation(line: 79, column: 21, scope: !135)
!147 = !DILocation(line: 82, column: 20, scope: !148)
!148 = distinct !DILexicalBlock(scope: !135, file: !14, line: 82, column: 13)
!149 = !DILocation(line: 82, column: 18, scope: !148)
!150 = !DILocation(line: 82, column: 25, scope: !151)
!151 = distinct !DILexicalBlock(scope: !148, file: !14, line: 82, column: 13)
!152 = !DILocation(line: 82, column: 29, scope: !151)
!153 = !DILocation(line: 82, column: 27, scope: !151)
!154 = !DILocation(line: 82, column: 13, scope: !148)
!155 = !DILocation(line: 84, column: 27, scope: !156)
!156 = distinct !DILexicalBlock(scope: !151, file: !14, line: 83, column: 13)
!157 = !DILocation(line: 84, column: 32, scope: !156)
!158 = !DILocation(line: 84, column: 22, scope: !156)
!159 = !DILocation(line: 84, column: 17, scope: !156)
!160 = !DILocation(line: 84, column: 25, scope: !156)
!161 = !DILocation(line: 85, column: 13, scope: !156)
!162 = !DILocation(line: 82, column: 39, scope: !151)
!163 = !DILocation(line: 82, column: 13, scope: !151)
!164 = distinct !{!164, !154, !165, !80}
!165 = !DILocation(line: 85, column: 13, scope: !148)
!166 = !DILocation(line: 86, column: 13, scope: !135)
!167 = !DILocation(line: 86, column: 25, scope: !135)
!168 = !DILocation(line: 87, column: 23, scope: !135)
!169 = !DILocation(line: 87, column: 13, scope: !135)
!170 = !DILocation(line: 90, column: 1, scope: !108)

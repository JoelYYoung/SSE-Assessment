; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__char_declare_loop_12.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__char_declare_loop_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_declare_loop_12_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !29
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !30
  store i8 0, i8* %arrayidx, align 1, !dbg !31
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !32
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !32
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !33
  store i8 0, i8* %arrayidx2, align 1, !dbg !34
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !35
  %tobool = icmp ne i32 %call, 0, !dbg !35
  br i1 %tobool, label %if.then, label %if.else, !dbg !37

if.then:                                          ; preds = %entry
  %arraydecay3 = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !38
  store i8* %arraydecay3, i8** %data, align 8, !dbg !40
  br label %if.end, !dbg !41

if.else:                                          ; preds = %entry
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !42
  store i8* %arraydecay4, i8** %data, align 8, !dbg !44
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !45, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !51, metadata !DIExpression()), !dbg !52
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !53, metadata !DIExpression()), !dbg !54
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !55
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay5, i8 67, i64 99, i1 false), !dbg !55
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !56
  store i8 0, i8* %arrayidx6, align 1, !dbg !57
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !58
  %call8 = call i64 @strlen(i8* %arraydecay7) #6, !dbg !59
  store i64 %call8, i64* %destLen, align 8, !dbg !60
  store i64 0, i64* %i, align 8, !dbg !61
  br label %for.cond, !dbg !63

for.cond:                                         ; preds = %for.inc, %if.end
  %0 = load i64, i64* %i, align 8, !dbg !64
  %1 = load i64, i64* %destLen, align 8, !dbg !66
  %cmp = icmp ult i64 %0, %1, !dbg !67
  br i1 %cmp, label %for.body, label %for.end, !dbg !68

for.body:                                         ; preds = %for.cond
  %2 = load i8*, i8** %data, align 8, !dbg !69
  %3 = load i64, i64* %i, align 8, !dbg !71
  %arrayidx9 = getelementptr inbounds i8, i8* %2, i64 %3, !dbg !69
  %4 = load i8, i8* %arrayidx9, align 1, !dbg !69
  %5 = load i64, i64* %i, align 8, !dbg !72
  %arrayidx10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %5, !dbg !73
  store i8 %4, i8* %arrayidx10, align 1, !dbg !74
  br label %for.inc, !dbg !75

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !76
  %inc = add i64 %6, 1, !dbg !76
  store i64 %inc, i64* %i, align 8, !dbg !76
  br label %for.cond, !dbg !77, !llvm.loop !78

for.end:                                          ; preds = %for.cond
  %arrayidx11 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !81
  store i8 0, i8* %arrayidx11, align 1, !dbg !82
  %arraydecay12 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !83
  call void @printLine(i8* %arraydecay12), !dbg !84
  ret void, !dbg !85
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
define dso_local void @CWE126_Buffer_Overread__char_declare_loop_12_good() #0 !dbg !86 {
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
  call void @CWE126_Buffer_Overread__char_declare_loop_12_good(), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !103
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !104
  call void @CWE126_Buffer_Overread__char_declare_loop_12_bad(), !dbg !105
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
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !109, metadata !DIExpression()), !dbg !110
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !111, metadata !DIExpression()), !dbg !112
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !113, metadata !DIExpression()), !dbg !114
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !115
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !115
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !116
  store i8 0, i8* %arrayidx, align 1, !dbg !117
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !118
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !118
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !119
  store i8 0, i8* %arrayidx2, align 1, !dbg !120
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !121
  %tobool = icmp ne i32 %call, 0, !dbg !121
  br i1 %tobool, label %if.then, label %if.else, !dbg !123

if.then:                                          ; preds = %entry
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !124
  store i8* %arraydecay3, i8** %data, align 8, !dbg !126
  br label %if.end, !dbg !127

if.else:                                          ; preds = %entry
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !128
  store i8* %arraydecay4, i8** %data, align 8, !dbg !130
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !131, metadata !DIExpression()), !dbg !133
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !134, metadata !DIExpression()), !dbg !135
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !136, metadata !DIExpression()), !dbg !137
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !138
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay5, i8 67, i64 99, i1 false), !dbg !138
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !139
  store i8 0, i8* %arrayidx6, align 1, !dbg !140
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !141
  %call8 = call i64 @strlen(i8* %arraydecay7) #6, !dbg !142
  store i64 %call8, i64* %destLen, align 8, !dbg !143
  store i64 0, i64* %i, align 8, !dbg !144
  br label %for.cond, !dbg !146

for.cond:                                         ; preds = %for.inc, %if.end
  %0 = load i64, i64* %i, align 8, !dbg !147
  %1 = load i64, i64* %destLen, align 8, !dbg !149
  %cmp = icmp ult i64 %0, %1, !dbg !150
  br i1 %cmp, label %for.body, label %for.end, !dbg !151

for.body:                                         ; preds = %for.cond
  %2 = load i8*, i8** %data, align 8, !dbg !152
  %3 = load i64, i64* %i, align 8, !dbg !154
  %arrayidx9 = getelementptr inbounds i8, i8* %2, i64 %3, !dbg !152
  %4 = load i8, i8* %arrayidx9, align 1, !dbg !152
  %5 = load i64, i64* %i, align 8, !dbg !155
  %arrayidx10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %5, !dbg !156
  store i8 %4, i8* %arrayidx10, align 1, !dbg !157
  br label %for.inc, !dbg !158

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !159
  %inc = add i64 %6, 1, !dbg !159
  store i64 %inc, i64* %i, align 8, !dbg !159
  br label %for.cond, !dbg !160, !llvm.loop !161

for.end:                                          ; preds = %for.cond
  %arrayidx11 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !163
  store i8 0, i8* %arrayidx11, align 1, !dbg !164
  %arraydecay12 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !165
  call void @printLine(i8* %arraydecay12), !dbg !166
  ret void, !dbg !167
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
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__char_declare_loop_12.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_declare_loop_12_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__char_declare_loop_12.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 25, column: 12, scope: !11)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 26, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 400, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 50)
!23 = !DILocation(line: 26, column: 10, scope: !11)
!24 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 27, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 800, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 27, column: 10, scope: !11)
!29 = !DILocation(line: 28, column: 5, scope: !11)
!30 = !DILocation(line: 29, column: 5, scope: !11)
!31 = !DILocation(line: 29, column: 25, scope: !11)
!32 = !DILocation(line: 30, column: 5, scope: !11)
!33 = !DILocation(line: 31, column: 5, scope: !11)
!34 = !DILocation(line: 31, column: 27, scope: !11)
!35 = !DILocation(line: 32, column: 8, scope: !36)
!36 = distinct !DILexicalBlock(scope: !11, file: !12, line: 32, column: 8)
!37 = !DILocation(line: 32, column: 8, scope: !11)
!38 = !DILocation(line: 35, column: 16, scope: !39)
!39 = distinct !DILexicalBlock(scope: !36, file: !12, line: 33, column: 5)
!40 = !DILocation(line: 35, column: 14, scope: !39)
!41 = !DILocation(line: 36, column: 5, scope: !39)
!42 = !DILocation(line: 40, column: 16, scope: !43)
!43 = distinct !DILexicalBlock(scope: !36, file: !12, line: 38, column: 5)
!44 = !DILocation(line: 40, column: 14, scope: !43)
!45 = !DILocalVariable(name: "i", scope: !46, file: !12, line: 43, type: !47)
!46 = distinct !DILexicalBlock(scope: !11, file: !12, line: 42, column: 5)
!47 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !48, line: 46, baseType: !49)
!48 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!49 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!50 = !DILocation(line: 43, column: 16, scope: !46)
!51 = !DILocalVariable(name: "destLen", scope: !46, file: !12, line: 43, type: !47)
!52 = !DILocation(line: 43, column: 19, scope: !46)
!53 = !DILocalVariable(name: "dest", scope: !46, file: !12, line: 44, type: !25)
!54 = !DILocation(line: 44, column: 14, scope: !46)
!55 = !DILocation(line: 45, column: 9, scope: !46)
!56 = !DILocation(line: 46, column: 9, scope: !46)
!57 = !DILocation(line: 46, column: 21, scope: !46)
!58 = !DILocation(line: 47, column: 26, scope: !46)
!59 = !DILocation(line: 47, column: 19, scope: !46)
!60 = !DILocation(line: 47, column: 17, scope: !46)
!61 = !DILocation(line: 50, column: 16, scope: !62)
!62 = distinct !DILexicalBlock(scope: !46, file: !12, line: 50, column: 9)
!63 = !DILocation(line: 50, column: 14, scope: !62)
!64 = !DILocation(line: 50, column: 21, scope: !65)
!65 = distinct !DILexicalBlock(scope: !62, file: !12, line: 50, column: 9)
!66 = !DILocation(line: 50, column: 25, scope: !65)
!67 = !DILocation(line: 50, column: 23, scope: !65)
!68 = !DILocation(line: 50, column: 9, scope: !62)
!69 = !DILocation(line: 52, column: 23, scope: !70)
!70 = distinct !DILexicalBlock(scope: !65, file: !12, line: 51, column: 9)
!71 = !DILocation(line: 52, column: 28, scope: !70)
!72 = !DILocation(line: 52, column: 18, scope: !70)
!73 = !DILocation(line: 52, column: 13, scope: !70)
!74 = !DILocation(line: 52, column: 21, scope: !70)
!75 = !DILocation(line: 53, column: 9, scope: !70)
!76 = !DILocation(line: 50, column: 35, scope: !65)
!77 = !DILocation(line: 50, column: 9, scope: !65)
!78 = distinct !{!78, !68, !79, !80}
!79 = !DILocation(line: 53, column: 9, scope: !62)
!80 = !{!"llvm.loop.mustprogress"}
!81 = !DILocation(line: 54, column: 9, scope: !46)
!82 = !DILocation(line: 54, column: 21, scope: !46)
!83 = !DILocation(line: 55, column: 19, scope: !46)
!84 = !DILocation(line: 55, column: 9, scope: !46)
!85 = !DILocation(line: 57, column: 1, scope: !11)
!86 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_declare_loop_12_good", scope: !12, file: !12, line: 101, type: !13, scopeLine: 102, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!87 = !DILocation(line: 103, column: 5, scope: !86)
!88 = !DILocation(line: 104, column: 1, scope: !86)
!89 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 116, type: !90, scopeLine: 117, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!90 = !DISubroutineType(types: !91)
!91 = !{!92, !92, !93}
!92 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!93 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!94 = !DILocalVariable(name: "argc", arg: 1, scope: !89, file: !12, line: 116, type: !92)
!95 = !DILocation(line: 116, column: 14, scope: !89)
!96 = !DILocalVariable(name: "argv", arg: 2, scope: !89, file: !12, line: 116, type: !93)
!97 = !DILocation(line: 116, column: 27, scope: !89)
!98 = !DILocation(line: 119, column: 22, scope: !89)
!99 = !DILocation(line: 119, column: 12, scope: !89)
!100 = !DILocation(line: 119, column: 5, scope: !89)
!101 = !DILocation(line: 121, column: 5, scope: !89)
!102 = !DILocation(line: 122, column: 5, scope: !89)
!103 = !DILocation(line: 123, column: 5, scope: !89)
!104 = !DILocation(line: 126, column: 5, scope: !89)
!105 = !DILocation(line: 127, column: 5, scope: !89)
!106 = !DILocation(line: 128, column: 5, scope: !89)
!107 = !DILocation(line: 130, column: 5, scope: !89)
!108 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 65, type: !13, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!109 = !DILocalVariable(name: "data", scope: !108, file: !12, line: 67, type: !16)
!110 = !DILocation(line: 67, column: 12, scope: !108)
!111 = !DILocalVariable(name: "dataBadBuffer", scope: !108, file: !12, line: 68, type: !20)
!112 = !DILocation(line: 68, column: 10, scope: !108)
!113 = !DILocalVariable(name: "dataGoodBuffer", scope: !108, file: !12, line: 69, type: !25)
!114 = !DILocation(line: 69, column: 10, scope: !108)
!115 = !DILocation(line: 70, column: 5, scope: !108)
!116 = !DILocation(line: 71, column: 5, scope: !108)
!117 = !DILocation(line: 71, column: 25, scope: !108)
!118 = !DILocation(line: 72, column: 5, scope: !108)
!119 = !DILocation(line: 73, column: 5, scope: !108)
!120 = !DILocation(line: 73, column: 27, scope: !108)
!121 = !DILocation(line: 74, column: 8, scope: !122)
!122 = distinct !DILexicalBlock(scope: !108, file: !12, line: 74, column: 8)
!123 = !DILocation(line: 74, column: 8, scope: !108)
!124 = !DILocation(line: 77, column: 16, scope: !125)
!125 = distinct !DILexicalBlock(scope: !122, file: !12, line: 75, column: 5)
!126 = !DILocation(line: 77, column: 14, scope: !125)
!127 = !DILocation(line: 78, column: 5, scope: !125)
!128 = !DILocation(line: 82, column: 16, scope: !129)
!129 = distinct !DILexicalBlock(scope: !122, file: !12, line: 80, column: 5)
!130 = !DILocation(line: 82, column: 14, scope: !129)
!131 = !DILocalVariable(name: "i", scope: !132, file: !12, line: 85, type: !47)
!132 = distinct !DILexicalBlock(scope: !108, file: !12, line: 84, column: 5)
!133 = !DILocation(line: 85, column: 16, scope: !132)
!134 = !DILocalVariable(name: "destLen", scope: !132, file: !12, line: 85, type: !47)
!135 = !DILocation(line: 85, column: 19, scope: !132)
!136 = !DILocalVariable(name: "dest", scope: !132, file: !12, line: 86, type: !25)
!137 = !DILocation(line: 86, column: 14, scope: !132)
!138 = !DILocation(line: 87, column: 9, scope: !132)
!139 = !DILocation(line: 88, column: 9, scope: !132)
!140 = !DILocation(line: 88, column: 21, scope: !132)
!141 = !DILocation(line: 89, column: 26, scope: !132)
!142 = !DILocation(line: 89, column: 19, scope: !132)
!143 = !DILocation(line: 89, column: 17, scope: !132)
!144 = !DILocation(line: 92, column: 16, scope: !145)
!145 = distinct !DILexicalBlock(scope: !132, file: !12, line: 92, column: 9)
!146 = !DILocation(line: 92, column: 14, scope: !145)
!147 = !DILocation(line: 92, column: 21, scope: !148)
!148 = distinct !DILexicalBlock(scope: !145, file: !12, line: 92, column: 9)
!149 = !DILocation(line: 92, column: 25, scope: !148)
!150 = !DILocation(line: 92, column: 23, scope: !148)
!151 = !DILocation(line: 92, column: 9, scope: !145)
!152 = !DILocation(line: 94, column: 23, scope: !153)
!153 = distinct !DILexicalBlock(scope: !148, file: !12, line: 93, column: 9)
!154 = !DILocation(line: 94, column: 28, scope: !153)
!155 = !DILocation(line: 94, column: 18, scope: !153)
!156 = !DILocation(line: 94, column: 13, scope: !153)
!157 = !DILocation(line: 94, column: 21, scope: !153)
!158 = !DILocation(line: 95, column: 9, scope: !153)
!159 = !DILocation(line: 92, column: 35, scope: !148)
!160 = !DILocation(line: 92, column: 9, scope: !148)
!161 = distinct !{!161, !151, !162, !80}
!162 = !DILocation(line: 95, column: 9, scope: !145)
!163 = !DILocation(line: 96, column: 9, scope: !132)
!164 = !DILocation(line: 96, column: 21, scope: !132)
!165 = !DILocation(line: 97, column: 19, scope: !132)
!166 = !DILocation(line: 97, column: 9, scope: !132)
!167 = !DILocation(line: 99, column: 1, scope: !108)

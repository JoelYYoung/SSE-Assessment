; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_loop_17.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_loop_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_declare_loop_17_bad() #0 !dbg !11 {
entry:
  %i = alloca i32, align 4
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %i5 = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %i, metadata !15, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata i32** %data, metadata !18, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !23, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !28, metadata !DIExpression()), !dbg !32
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !33
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 49) #5, !dbg !34
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !35
  store i32 0, i32* %arrayidx, align 4, !dbg !36
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !37
  %call2 = call i32* @wmemset(i32* %arraydecay1, i32 65, i64 99) #5, !dbg !38
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !39
  store i32 0, i32* %arrayidx3, align 4, !dbg !40
  store i32 0, i32* %i, align 4, !dbg !41
  br label %for.cond, !dbg !43

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !44
  %cmp = icmp slt i32 %0, 1, !dbg !46
  br i1 %cmp, label %for.body, label %for.end, !dbg !47

for.body:                                         ; preds = %for.cond
  %arraydecay4 = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !48
  store i32* %arraydecay4, i32** %data, align 8, !dbg !50
  br label %for.inc, !dbg !51

for.inc:                                          ; preds = %for.body
  %1 = load i32, i32* %i, align 4, !dbg !52
  %inc = add nsw i32 %1, 1, !dbg !52
  store i32 %inc, i32* %i, align 4, !dbg !52
  br label %for.cond, !dbg !53, !llvm.loop !54

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i5, metadata !57, metadata !DIExpression()), !dbg !61
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !62, metadata !DIExpression()), !dbg !63
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !64, metadata !DIExpression()), !dbg !65
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !66
  %call7 = call i32* @wmemset(i32* %arraydecay6, i32 67, i64 99) #5, !dbg !67
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !68
  store i32 0, i32* %arrayidx8, align 4, !dbg !69
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !70
  %call10 = call i64 @wcslen(i32* %arraydecay9) #6, !dbg !71
  store i64 %call10, i64* %destLen, align 8, !dbg !72
  store i64 0, i64* %i5, align 8, !dbg !73
  br label %for.cond11, !dbg !75

for.cond11:                                       ; preds = %for.inc16, %for.end
  %2 = load i64, i64* %i5, align 8, !dbg !76
  %3 = load i64, i64* %destLen, align 8, !dbg !78
  %cmp12 = icmp ult i64 %2, %3, !dbg !79
  br i1 %cmp12, label %for.body13, label %for.end18, !dbg !80

for.body13:                                       ; preds = %for.cond11
  %4 = load i32*, i32** %data, align 8, !dbg !81
  %5 = load i64, i64* %i5, align 8, !dbg !83
  %arrayidx14 = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !81
  %6 = load i32, i32* %arrayidx14, align 4, !dbg !81
  %7 = load i64, i64* %i5, align 8, !dbg !84
  %arrayidx15 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %7, !dbg !85
  store i32 %6, i32* %arrayidx15, align 4, !dbg !86
  br label %for.inc16, !dbg !87

for.inc16:                                        ; preds = %for.body13
  %8 = load i64, i64* %i5, align 8, !dbg !88
  %inc17 = add i64 %8, 1, !dbg !88
  store i64 %inc17, i64* %i5, align 8, !dbg !88
  br label %for.cond11, !dbg !89, !llvm.loop !90

for.end18:                                        ; preds = %for.cond11
  %arrayidx19 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !92
  store i32 0, i32* %arrayidx19, align 4, !dbg !93
  %arraydecay20 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !94
  call void @printWLine(i32* %arraydecay20), !dbg !95
  ret void, !dbg !96
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_declare_loop_17_good() #0 !dbg !97 {
entry:
  call void @goodG2B(), !dbg !98
  ret void, !dbg !99
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !100 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !106, metadata !DIExpression()), !dbg !107
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !108, metadata !DIExpression()), !dbg !109
  %call = call i64 @time(i64* null) #5, !dbg !110
  %conv = trunc i64 %call to i32, !dbg !111
  call void @srand(i32 %conv) #5, !dbg !112
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !113
  call void @CWE126_Buffer_Overread__wchar_t_declare_loop_17_good(), !dbg !114
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !115
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !116
  call void @CWE126_Buffer_Overread__wchar_t_declare_loop_17_bad(), !dbg !117
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !118
  ret i32 0, !dbg !119
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !120 {
entry:
  %h = alloca i32, align 4
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %h, metadata !121, metadata !DIExpression()), !dbg !122
  call void @llvm.dbg.declare(metadata i32** %data, metadata !123, metadata !DIExpression()), !dbg !124
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !125, metadata !DIExpression()), !dbg !126
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !127, metadata !DIExpression()), !dbg !128
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !129
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 49) #5, !dbg !130
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !131
  store i32 0, i32* %arrayidx, align 4, !dbg !132
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !133
  %call2 = call i32* @wmemset(i32* %arraydecay1, i32 65, i64 99) #5, !dbg !134
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !135
  store i32 0, i32* %arrayidx3, align 4, !dbg !136
  store i32 0, i32* %h, align 4, !dbg !137
  br label %for.cond, !dbg !139

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %h, align 4, !dbg !140
  %cmp = icmp slt i32 %0, 1, !dbg !142
  br i1 %cmp, label %for.body, label %for.end, !dbg !143

for.body:                                         ; preds = %for.cond
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !144
  store i32* %arraydecay4, i32** %data, align 8, !dbg !146
  br label %for.inc, !dbg !147

for.inc:                                          ; preds = %for.body
  %1 = load i32, i32* %h, align 4, !dbg !148
  %inc = add nsw i32 %1, 1, !dbg !148
  store i32 %inc, i32* %h, align 4, !dbg !148
  br label %for.cond, !dbg !149, !llvm.loop !150

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i, metadata !152, metadata !DIExpression()), !dbg !154
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !155, metadata !DIExpression()), !dbg !156
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !157, metadata !DIExpression()), !dbg !158
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !159
  %call6 = call i32* @wmemset(i32* %arraydecay5, i32 67, i64 99) #5, !dbg !160
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !161
  store i32 0, i32* %arrayidx7, align 4, !dbg !162
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !163
  %call9 = call i64 @wcslen(i32* %arraydecay8) #6, !dbg !164
  store i64 %call9, i64* %destLen, align 8, !dbg !165
  store i64 0, i64* %i, align 8, !dbg !166
  br label %for.cond10, !dbg !168

for.cond10:                                       ; preds = %for.inc15, %for.end
  %2 = load i64, i64* %i, align 8, !dbg !169
  %3 = load i64, i64* %destLen, align 8, !dbg !171
  %cmp11 = icmp ult i64 %2, %3, !dbg !172
  br i1 %cmp11, label %for.body12, label %for.end17, !dbg !173

for.body12:                                       ; preds = %for.cond10
  %4 = load i32*, i32** %data, align 8, !dbg !174
  %5 = load i64, i64* %i, align 8, !dbg !176
  %arrayidx13 = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !174
  %6 = load i32, i32* %arrayidx13, align 4, !dbg !174
  %7 = load i64, i64* %i, align 8, !dbg !177
  %arrayidx14 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %7, !dbg !178
  store i32 %6, i32* %arrayidx14, align 4, !dbg !179
  br label %for.inc15, !dbg !180

for.inc15:                                        ; preds = %for.body12
  %8 = load i64, i64* %i, align 8, !dbg !181
  %inc16 = add i64 %8, 1, !dbg !181
  store i64 %inc16, i64* %i, align 8, !dbg !181
  br label %for.cond10, !dbg !182, !llvm.loop !183

for.end17:                                        ; preds = %for.cond10
  %arrayidx18 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !185
  store i32 0, i32* %arrayidx18, align 4, !dbg !186
  %arraydecay19 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !187
  call void @printWLine(i32* %arraydecay19), !dbg !188
  ret void, !dbg !189
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_loop_17.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_loop_17_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_loop_17.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "i", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocation(line: 25, column: 9, scope: !11)
!18 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 26, type: !19)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !21, line: 74, baseType: !16)
!21 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!22 = !DILocation(line: 26, column: 15, scope: !11)
!23 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 27, type: !24)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 1600, elements: !25)
!25 = !{!26}
!26 = !DISubrange(count: 50)
!27 = !DILocation(line: 27, column: 13, scope: !11)
!28 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 28, type: !29)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 3200, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 100)
!32 = !DILocation(line: 28, column: 13, scope: !11)
!33 = !DILocation(line: 29, column: 13, scope: !11)
!34 = !DILocation(line: 29, column: 5, scope: !11)
!35 = !DILocation(line: 30, column: 5, scope: !11)
!36 = !DILocation(line: 30, column: 25, scope: !11)
!37 = !DILocation(line: 31, column: 13, scope: !11)
!38 = !DILocation(line: 31, column: 5, scope: !11)
!39 = !DILocation(line: 32, column: 5, scope: !11)
!40 = !DILocation(line: 32, column: 27, scope: !11)
!41 = !DILocation(line: 33, column: 11, scope: !42)
!42 = distinct !DILexicalBlock(scope: !11, file: !12, line: 33, column: 5)
!43 = !DILocation(line: 33, column: 9, scope: !42)
!44 = !DILocation(line: 33, column: 16, scope: !45)
!45 = distinct !DILexicalBlock(scope: !42, file: !12, line: 33, column: 5)
!46 = !DILocation(line: 33, column: 18, scope: !45)
!47 = !DILocation(line: 33, column: 5, scope: !42)
!48 = !DILocation(line: 36, column: 16, scope: !49)
!49 = distinct !DILexicalBlock(scope: !45, file: !12, line: 34, column: 5)
!50 = !DILocation(line: 36, column: 14, scope: !49)
!51 = !DILocation(line: 37, column: 5, scope: !49)
!52 = !DILocation(line: 33, column: 24, scope: !45)
!53 = !DILocation(line: 33, column: 5, scope: !45)
!54 = distinct !{!54, !47, !55, !56}
!55 = !DILocation(line: 37, column: 5, scope: !42)
!56 = !{!"llvm.loop.mustprogress"}
!57 = !DILocalVariable(name: "i", scope: !58, file: !12, line: 39, type: !59)
!58 = distinct !DILexicalBlock(scope: !11, file: !12, line: 38, column: 5)
!59 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !21, line: 46, baseType: !60)
!60 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!61 = !DILocation(line: 39, column: 16, scope: !58)
!62 = !DILocalVariable(name: "destLen", scope: !58, file: !12, line: 39, type: !59)
!63 = !DILocation(line: 39, column: 19, scope: !58)
!64 = !DILocalVariable(name: "dest", scope: !58, file: !12, line: 40, type: !29)
!65 = !DILocation(line: 40, column: 17, scope: !58)
!66 = !DILocation(line: 41, column: 17, scope: !58)
!67 = !DILocation(line: 41, column: 9, scope: !58)
!68 = !DILocation(line: 42, column: 9, scope: !58)
!69 = !DILocation(line: 42, column: 21, scope: !58)
!70 = !DILocation(line: 43, column: 26, scope: !58)
!71 = !DILocation(line: 43, column: 19, scope: !58)
!72 = !DILocation(line: 43, column: 17, scope: !58)
!73 = !DILocation(line: 46, column: 16, scope: !74)
!74 = distinct !DILexicalBlock(scope: !58, file: !12, line: 46, column: 9)
!75 = !DILocation(line: 46, column: 14, scope: !74)
!76 = !DILocation(line: 46, column: 21, scope: !77)
!77 = distinct !DILexicalBlock(scope: !74, file: !12, line: 46, column: 9)
!78 = !DILocation(line: 46, column: 25, scope: !77)
!79 = !DILocation(line: 46, column: 23, scope: !77)
!80 = !DILocation(line: 46, column: 9, scope: !74)
!81 = !DILocation(line: 48, column: 23, scope: !82)
!82 = distinct !DILexicalBlock(scope: !77, file: !12, line: 47, column: 9)
!83 = !DILocation(line: 48, column: 28, scope: !82)
!84 = !DILocation(line: 48, column: 18, scope: !82)
!85 = !DILocation(line: 48, column: 13, scope: !82)
!86 = !DILocation(line: 48, column: 21, scope: !82)
!87 = !DILocation(line: 49, column: 9, scope: !82)
!88 = !DILocation(line: 46, column: 35, scope: !77)
!89 = !DILocation(line: 46, column: 9, scope: !77)
!90 = distinct !{!90, !80, !91, !56}
!91 = !DILocation(line: 49, column: 9, scope: !74)
!92 = !DILocation(line: 50, column: 9, scope: !58)
!93 = !DILocation(line: 50, column: 21, scope: !58)
!94 = !DILocation(line: 51, column: 20, scope: !58)
!95 = !DILocation(line: 51, column: 9, scope: !58)
!96 = !DILocation(line: 53, column: 1, scope: !11)
!97 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_loop_17_good", scope: !12, file: !12, line: 92, type: !13, scopeLine: 93, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!98 = !DILocation(line: 94, column: 5, scope: !97)
!99 = !DILocation(line: 95, column: 1, scope: !97)
!100 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 107, type: !101, scopeLine: 108, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!101 = !DISubroutineType(types: !102)
!102 = !{!16, !16, !103}
!103 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !104, size: 64)
!104 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !105, size: 64)
!105 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!106 = !DILocalVariable(name: "argc", arg: 1, scope: !100, file: !12, line: 107, type: !16)
!107 = !DILocation(line: 107, column: 14, scope: !100)
!108 = !DILocalVariable(name: "argv", arg: 2, scope: !100, file: !12, line: 107, type: !103)
!109 = !DILocation(line: 107, column: 27, scope: !100)
!110 = !DILocation(line: 110, column: 22, scope: !100)
!111 = !DILocation(line: 110, column: 12, scope: !100)
!112 = !DILocation(line: 110, column: 5, scope: !100)
!113 = !DILocation(line: 112, column: 5, scope: !100)
!114 = !DILocation(line: 113, column: 5, scope: !100)
!115 = !DILocation(line: 114, column: 5, scope: !100)
!116 = !DILocation(line: 117, column: 5, scope: !100)
!117 = !DILocation(line: 118, column: 5, scope: !100)
!118 = !DILocation(line: 119, column: 5, scope: !100)
!119 = !DILocation(line: 121, column: 5, scope: !100)
!120 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 60, type: !13, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!121 = !DILocalVariable(name: "h", scope: !120, file: !12, line: 62, type: !16)
!122 = !DILocation(line: 62, column: 9, scope: !120)
!123 = !DILocalVariable(name: "data", scope: !120, file: !12, line: 63, type: !19)
!124 = !DILocation(line: 63, column: 15, scope: !120)
!125 = !DILocalVariable(name: "dataBadBuffer", scope: !120, file: !12, line: 64, type: !24)
!126 = !DILocation(line: 64, column: 13, scope: !120)
!127 = !DILocalVariable(name: "dataGoodBuffer", scope: !120, file: !12, line: 65, type: !29)
!128 = !DILocation(line: 65, column: 13, scope: !120)
!129 = !DILocation(line: 66, column: 13, scope: !120)
!130 = !DILocation(line: 66, column: 5, scope: !120)
!131 = !DILocation(line: 67, column: 5, scope: !120)
!132 = !DILocation(line: 67, column: 25, scope: !120)
!133 = !DILocation(line: 68, column: 13, scope: !120)
!134 = !DILocation(line: 68, column: 5, scope: !120)
!135 = !DILocation(line: 69, column: 5, scope: !120)
!136 = !DILocation(line: 69, column: 27, scope: !120)
!137 = !DILocation(line: 70, column: 11, scope: !138)
!138 = distinct !DILexicalBlock(scope: !120, file: !12, line: 70, column: 5)
!139 = !DILocation(line: 70, column: 9, scope: !138)
!140 = !DILocation(line: 70, column: 16, scope: !141)
!141 = distinct !DILexicalBlock(scope: !138, file: !12, line: 70, column: 5)
!142 = !DILocation(line: 70, column: 18, scope: !141)
!143 = !DILocation(line: 70, column: 5, scope: !138)
!144 = !DILocation(line: 73, column: 16, scope: !145)
!145 = distinct !DILexicalBlock(scope: !141, file: !12, line: 71, column: 5)
!146 = !DILocation(line: 73, column: 14, scope: !145)
!147 = !DILocation(line: 74, column: 5, scope: !145)
!148 = !DILocation(line: 70, column: 24, scope: !141)
!149 = !DILocation(line: 70, column: 5, scope: !141)
!150 = distinct !{!150, !143, !151, !56}
!151 = !DILocation(line: 74, column: 5, scope: !138)
!152 = !DILocalVariable(name: "i", scope: !153, file: !12, line: 76, type: !59)
!153 = distinct !DILexicalBlock(scope: !120, file: !12, line: 75, column: 5)
!154 = !DILocation(line: 76, column: 16, scope: !153)
!155 = !DILocalVariable(name: "destLen", scope: !153, file: !12, line: 76, type: !59)
!156 = !DILocation(line: 76, column: 19, scope: !153)
!157 = !DILocalVariable(name: "dest", scope: !153, file: !12, line: 77, type: !29)
!158 = !DILocation(line: 77, column: 17, scope: !153)
!159 = !DILocation(line: 78, column: 17, scope: !153)
!160 = !DILocation(line: 78, column: 9, scope: !153)
!161 = !DILocation(line: 79, column: 9, scope: !153)
!162 = !DILocation(line: 79, column: 21, scope: !153)
!163 = !DILocation(line: 80, column: 26, scope: !153)
!164 = !DILocation(line: 80, column: 19, scope: !153)
!165 = !DILocation(line: 80, column: 17, scope: !153)
!166 = !DILocation(line: 83, column: 16, scope: !167)
!167 = distinct !DILexicalBlock(scope: !153, file: !12, line: 83, column: 9)
!168 = !DILocation(line: 83, column: 14, scope: !167)
!169 = !DILocation(line: 83, column: 21, scope: !170)
!170 = distinct !DILexicalBlock(scope: !167, file: !12, line: 83, column: 9)
!171 = !DILocation(line: 83, column: 25, scope: !170)
!172 = !DILocation(line: 83, column: 23, scope: !170)
!173 = !DILocation(line: 83, column: 9, scope: !167)
!174 = !DILocation(line: 85, column: 23, scope: !175)
!175 = distinct !DILexicalBlock(scope: !170, file: !12, line: 84, column: 9)
!176 = !DILocation(line: 85, column: 28, scope: !175)
!177 = !DILocation(line: 85, column: 18, scope: !175)
!178 = !DILocation(line: 85, column: 13, scope: !175)
!179 = !DILocation(line: 85, column: 21, scope: !175)
!180 = !DILocation(line: 86, column: 9, scope: !175)
!181 = !DILocation(line: 83, column: 35, scope: !170)
!182 = !DILocation(line: 83, column: 9, scope: !170)
!183 = distinct !{!183, !173, !184, !56}
!184 = !DILocation(line: 86, column: 9, scope: !167)
!185 = !DILocation(line: 87, column: 9, scope: !153)
!186 = !DILocation(line: 87, column: 21, scope: !153)
!187 = !DILocation(line: 88, column: 20, scope: !153)
!188 = !DILocation(line: 88, column: 9, scope: !153)
!189 = !DILocation(line: 90, column: 1, scope: !120)

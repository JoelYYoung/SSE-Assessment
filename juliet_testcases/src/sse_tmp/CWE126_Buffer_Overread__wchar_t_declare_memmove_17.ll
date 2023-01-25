; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_memmove_17.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_memmove_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_declare_memmove_17_bad() #0 !dbg !11 {
entry:
  %i = alloca i32, align 4
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %i, metadata !15, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata i32** %data, metadata !18, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !23, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !28, metadata !DIExpression()), !dbg !32
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !33
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 49) #6, !dbg !34
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !35
  store i32 0, i32* %arrayidx, align 4, !dbg !36
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !37
  %call2 = call i32* @wmemset(i32* %arraydecay1, i32 65, i64 99) #6, !dbg !38
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
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !57, metadata !DIExpression()), !dbg !59
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !60
  %call6 = call i32* @wmemset(i32* %arraydecay5, i32 67, i64 99) #6, !dbg !61
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !62
  store i32 0, i32* %arrayidx7, align 4, !dbg !63
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !64
  %2 = bitcast i32* %arraydecay8 to i8*, !dbg !64
  %3 = load i32*, i32** %data, align 8, !dbg !65
  %4 = bitcast i32* %3 to i8*, !dbg !64
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !66
  %call10 = call i64 @wcslen(i32* %arraydecay9) #7, !dbg !67
  %mul = mul i64 %call10, 4, !dbg !68
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %2, i8* align 4 %4, i64 %mul, i1 false), !dbg !64
  %arrayidx11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !69
  store i32 0, i32* %arrayidx11, align 4, !dbg !70
  %arraydecay12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !71
  call void @printWLine(i32* %arraydecay12), !dbg !72
  ret void, !dbg !73
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_declare_memmove_17_good() #0 !dbg !74 {
entry:
  call void @goodG2B(), !dbg !75
  ret void, !dbg !76
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !77 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !83, metadata !DIExpression()), !dbg !84
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !85, metadata !DIExpression()), !dbg !86
  %call = call i64 @time(i64* null) #6, !dbg !87
  %conv = trunc i64 %call to i32, !dbg !88
  call void @srand(i32 %conv) #6, !dbg !89
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !90
  call void @CWE126_Buffer_Overread__wchar_t_declare_memmove_17_good(), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !93
  call void @CWE126_Buffer_Overread__wchar_t_declare_memmove_17_bad(), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !95
  ret i32 0, !dbg !96
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !97 {
entry:
  %h = alloca i32, align 4
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %h, metadata !98, metadata !DIExpression()), !dbg !99
  call void @llvm.dbg.declare(metadata i32** %data, metadata !100, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !102, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !104, metadata !DIExpression()), !dbg !105
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !106
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 49) #6, !dbg !107
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !108
  store i32 0, i32* %arrayidx, align 4, !dbg !109
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !110
  %call2 = call i32* @wmemset(i32* %arraydecay1, i32 65, i64 99) #6, !dbg !111
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !112
  store i32 0, i32* %arrayidx3, align 4, !dbg !113
  store i32 0, i32* %h, align 4, !dbg !114
  br label %for.cond, !dbg !116

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %h, align 4, !dbg !117
  %cmp = icmp slt i32 %0, 1, !dbg !119
  br i1 %cmp, label %for.body, label %for.end, !dbg !120

for.body:                                         ; preds = %for.cond
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !121
  store i32* %arraydecay4, i32** %data, align 8, !dbg !123
  br label %for.inc, !dbg !124

for.inc:                                          ; preds = %for.body
  %1 = load i32, i32* %h, align 4, !dbg !125
  %inc = add nsw i32 %1, 1, !dbg !125
  store i32 %inc, i32* %h, align 4, !dbg !125
  br label %for.cond, !dbg !126, !llvm.loop !127

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !129, metadata !DIExpression()), !dbg !131
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !132
  %call6 = call i32* @wmemset(i32* %arraydecay5, i32 67, i64 99) #6, !dbg !133
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !134
  store i32 0, i32* %arrayidx7, align 4, !dbg !135
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !136
  %2 = bitcast i32* %arraydecay8 to i8*, !dbg !136
  %3 = load i32*, i32** %data, align 8, !dbg !137
  %4 = bitcast i32* %3 to i8*, !dbg !136
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !138
  %call10 = call i64 @wcslen(i32* %arraydecay9) #7, !dbg !139
  %mul = mul i64 %call10, 4, !dbg !140
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %2, i8* align 4 %4, i64 %mul, i1 false), !dbg !136
  %arrayidx11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !141
  store i32 0, i32* %arrayidx11, align 4, !dbg !142
  %arraydecay12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !143
  call void @printWLine(i32* %arraydecay12), !dbg !144
  ret void, !dbg !145
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_memmove_17.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_memmove_17_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_memmove_17.c", directory: "/home/joelyang/SSE-Assessment")
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
!57 = !DILocalVariable(name: "dest", scope: !58, file: !12, line: 39, type: !29)
!58 = distinct !DILexicalBlock(scope: !11, file: !12, line: 38, column: 5)
!59 = !DILocation(line: 39, column: 17, scope: !58)
!60 = !DILocation(line: 40, column: 17, scope: !58)
!61 = !DILocation(line: 40, column: 9, scope: !58)
!62 = !DILocation(line: 41, column: 9, scope: !58)
!63 = !DILocation(line: 41, column: 21, scope: !58)
!64 = !DILocation(line: 44, column: 9, scope: !58)
!65 = !DILocation(line: 44, column: 23, scope: !58)
!66 = !DILocation(line: 44, column: 36, scope: !58)
!67 = !DILocation(line: 44, column: 29, scope: !58)
!68 = !DILocation(line: 44, column: 41, scope: !58)
!69 = !DILocation(line: 45, column: 9, scope: !58)
!70 = !DILocation(line: 45, column: 21, scope: !58)
!71 = !DILocation(line: 46, column: 20, scope: !58)
!72 = !DILocation(line: 46, column: 9, scope: !58)
!73 = !DILocation(line: 48, column: 1, scope: !11)
!74 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_memmove_17_good", scope: !12, file: !12, line: 82, type: !13, scopeLine: 83, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DILocation(line: 84, column: 5, scope: !74)
!76 = !DILocation(line: 85, column: 1, scope: !74)
!77 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 97, type: !78, scopeLine: 98, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DISubroutineType(types: !79)
!79 = !{!16, !16, !80}
!80 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !81, size: 64)
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !82, size: 64)
!82 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!83 = !DILocalVariable(name: "argc", arg: 1, scope: !77, file: !12, line: 97, type: !16)
!84 = !DILocation(line: 97, column: 14, scope: !77)
!85 = !DILocalVariable(name: "argv", arg: 2, scope: !77, file: !12, line: 97, type: !80)
!86 = !DILocation(line: 97, column: 27, scope: !77)
!87 = !DILocation(line: 100, column: 22, scope: !77)
!88 = !DILocation(line: 100, column: 12, scope: !77)
!89 = !DILocation(line: 100, column: 5, scope: !77)
!90 = !DILocation(line: 102, column: 5, scope: !77)
!91 = !DILocation(line: 103, column: 5, scope: !77)
!92 = !DILocation(line: 104, column: 5, scope: !77)
!93 = !DILocation(line: 107, column: 5, scope: !77)
!94 = !DILocation(line: 108, column: 5, scope: !77)
!95 = !DILocation(line: 109, column: 5, scope: !77)
!96 = !DILocation(line: 111, column: 5, scope: !77)
!97 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 55, type: !13, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!98 = !DILocalVariable(name: "h", scope: !97, file: !12, line: 57, type: !16)
!99 = !DILocation(line: 57, column: 9, scope: !97)
!100 = !DILocalVariable(name: "data", scope: !97, file: !12, line: 58, type: !19)
!101 = !DILocation(line: 58, column: 15, scope: !97)
!102 = !DILocalVariable(name: "dataBadBuffer", scope: !97, file: !12, line: 59, type: !24)
!103 = !DILocation(line: 59, column: 13, scope: !97)
!104 = !DILocalVariable(name: "dataGoodBuffer", scope: !97, file: !12, line: 60, type: !29)
!105 = !DILocation(line: 60, column: 13, scope: !97)
!106 = !DILocation(line: 61, column: 13, scope: !97)
!107 = !DILocation(line: 61, column: 5, scope: !97)
!108 = !DILocation(line: 62, column: 5, scope: !97)
!109 = !DILocation(line: 62, column: 25, scope: !97)
!110 = !DILocation(line: 63, column: 13, scope: !97)
!111 = !DILocation(line: 63, column: 5, scope: !97)
!112 = !DILocation(line: 64, column: 5, scope: !97)
!113 = !DILocation(line: 64, column: 27, scope: !97)
!114 = !DILocation(line: 65, column: 11, scope: !115)
!115 = distinct !DILexicalBlock(scope: !97, file: !12, line: 65, column: 5)
!116 = !DILocation(line: 65, column: 9, scope: !115)
!117 = !DILocation(line: 65, column: 16, scope: !118)
!118 = distinct !DILexicalBlock(scope: !115, file: !12, line: 65, column: 5)
!119 = !DILocation(line: 65, column: 18, scope: !118)
!120 = !DILocation(line: 65, column: 5, scope: !115)
!121 = !DILocation(line: 68, column: 16, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !12, line: 66, column: 5)
!123 = !DILocation(line: 68, column: 14, scope: !122)
!124 = !DILocation(line: 69, column: 5, scope: !122)
!125 = !DILocation(line: 65, column: 24, scope: !118)
!126 = !DILocation(line: 65, column: 5, scope: !118)
!127 = distinct !{!127, !120, !128, !56}
!128 = !DILocation(line: 69, column: 5, scope: !115)
!129 = !DILocalVariable(name: "dest", scope: !130, file: !12, line: 71, type: !29)
!130 = distinct !DILexicalBlock(scope: !97, file: !12, line: 70, column: 5)
!131 = !DILocation(line: 71, column: 17, scope: !130)
!132 = !DILocation(line: 72, column: 17, scope: !130)
!133 = !DILocation(line: 72, column: 9, scope: !130)
!134 = !DILocation(line: 73, column: 9, scope: !130)
!135 = !DILocation(line: 73, column: 21, scope: !130)
!136 = !DILocation(line: 76, column: 9, scope: !130)
!137 = !DILocation(line: 76, column: 23, scope: !130)
!138 = !DILocation(line: 76, column: 36, scope: !130)
!139 = !DILocation(line: 76, column: 29, scope: !130)
!140 = !DILocation(line: 76, column: 41, scope: !130)
!141 = !DILocation(line: 77, column: 9, scope: !130)
!142 = !DILocation(line: 77, column: 21, scope: !130)
!143 = !DILocation(line: 78, column: 20, scope: !130)
!144 = !DILocation(line: 78, column: 9, scope: !130)
!145 = !DILocation(line: 80, column: 1, scope: !97)

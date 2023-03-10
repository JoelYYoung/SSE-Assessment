; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__char_declare_ncpy_16.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__char_declare_ncpy_16.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_declare_ncpy_16_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !19, metadata !DIExpression()), !dbg !23
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !24
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !24
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !25
  store i8 0, i8* %arrayidx, align 1, !dbg !26
  br label %while.body, !dbg !27

while.body:                                       ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !28
  %add.ptr = getelementptr inbounds i8, i8* %arraydecay1, i64 -8, !dbg !30
  store i8* %add.ptr, i8** %data, align 8, !dbg !31
  br label %while.end, !dbg !32

while.end:                                        ; preds = %while.body
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !33, metadata !DIExpression()), !dbg !35
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !36
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 99, i1 false), !dbg !36
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !37
  store i8 0, i8* %arrayidx3, align 1, !dbg !38
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !39
  %0 = load i8*, i8** %data, align 8, !dbg !40
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !41
  %call = call i64 @strlen(i8* %arraydecay5) #6, !dbg !42
  %call6 = call i8* @strncpy(i8* %arraydecay4, i8* %0, i64 %call) #7, !dbg !43
  %arrayidx7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !44
  store i8 0, i8* %arrayidx7, align 1, !dbg !45
  %arraydecay8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !46
  call void @printLine(i8* %arraydecay8), !dbg !47
  ret void, !dbg !48
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8*, i8*, i64) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #4

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_declare_ncpy_16_good() #0 !dbg !49 {
entry:
  call void @goodG2B(), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !52 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !57, metadata !DIExpression()), !dbg !58
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !59, metadata !DIExpression()), !dbg !60
  %call = call i64 @time(i64* null) #7, !dbg !61
  %conv = trunc i64 %call to i32, !dbg !62
  call void @srand(i32 %conv) #7, !dbg !63
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !64
  call void @CWE127_Buffer_Underread__char_declare_ncpy_16_good(), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !67
  call void @CWE127_Buffer_Underread__char_declare_ncpy_16_bad(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !69
  ret i32 0, !dbg !70
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !71 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !72, metadata !DIExpression()), !dbg !73
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !74, metadata !DIExpression()), !dbg !75
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !76
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !76
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !77
  store i8 0, i8* %arrayidx, align 1, !dbg !78
  br label %while.body, !dbg !79

while.body:                                       ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !80
  store i8* %arraydecay1, i8** %data, align 8, !dbg !82
  br label %while.end, !dbg !83

while.end:                                        ; preds = %while.body
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !84, metadata !DIExpression()), !dbg !86
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !87
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 99, i1 false), !dbg !87
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !88
  store i8 0, i8* %arrayidx3, align 1, !dbg !89
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !90
  %0 = load i8*, i8** %data, align 8, !dbg !91
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !92
  %call = call i64 @strlen(i8* %arraydecay5) #6, !dbg !93
  %call6 = call i8* @strncpy(i8* %arraydecay4, i8* %0, i64 %call) #7, !dbg !94
  %arrayidx7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !95
  store i8 0, i8* %arrayidx7, align 1, !dbg !96
  %arraydecay8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !97
  call void @printLine(i8* %arraydecay8), !dbg !98
  ret void, !dbg !99
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__char_declare_ncpy_16.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_declare_ncpy_16_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__char_declare_ncpy_16.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 25, column: 12, scope: !11)
!19 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 26, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 800, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 100)
!23 = !DILocation(line: 26, column: 10, scope: !11)
!24 = !DILocation(line: 27, column: 5, scope: !11)
!25 = !DILocation(line: 28, column: 5, scope: !11)
!26 = !DILocation(line: 28, column: 23, scope: !11)
!27 = !DILocation(line: 29, column: 5, scope: !11)
!28 = !DILocation(line: 32, column: 16, scope: !29)
!29 = distinct !DILexicalBlock(scope: !11, file: !12, line: 30, column: 5)
!30 = !DILocation(line: 32, column: 27, scope: !29)
!31 = !DILocation(line: 32, column: 14, scope: !29)
!32 = !DILocation(line: 33, column: 9, scope: !29)
!33 = !DILocalVariable(name: "dest", scope: !34, file: !12, line: 36, type: !20)
!34 = distinct !DILexicalBlock(scope: !11, file: !12, line: 35, column: 5)
!35 = !DILocation(line: 36, column: 14, scope: !34)
!36 = !DILocation(line: 37, column: 9, scope: !34)
!37 = !DILocation(line: 38, column: 9, scope: !34)
!38 = !DILocation(line: 38, column: 21, scope: !34)
!39 = !DILocation(line: 40, column: 17, scope: !34)
!40 = !DILocation(line: 40, column: 23, scope: !34)
!41 = !DILocation(line: 40, column: 36, scope: !34)
!42 = !DILocation(line: 40, column: 29, scope: !34)
!43 = !DILocation(line: 40, column: 9, scope: !34)
!44 = !DILocation(line: 42, column: 9, scope: !34)
!45 = !DILocation(line: 42, column: 21, scope: !34)
!46 = !DILocation(line: 43, column: 19, scope: !34)
!47 = !DILocation(line: 43, column: 9, scope: !34)
!48 = !DILocation(line: 45, column: 1, scope: !11)
!49 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_declare_ncpy_16_good", scope: !12, file: !12, line: 76, type: !13, scopeLine: 77, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!50 = !DILocation(line: 78, column: 5, scope: !49)
!51 = !DILocation(line: 79, column: 1, scope: !49)
!52 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 91, type: !53, scopeLine: 92, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DISubroutineType(types: !54)
!54 = !{!55, !55, !56}
!55 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!57 = !DILocalVariable(name: "argc", arg: 1, scope: !52, file: !12, line: 91, type: !55)
!58 = !DILocation(line: 91, column: 14, scope: !52)
!59 = !DILocalVariable(name: "argv", arg: 2, scope: !52, file: !12, line: 91, type: !56)
!60 = !DILocation(line: 91, column: 27, scope: !52)
!61 = !DILocation(line: 94, column: 22, scope: !52)
!62 = !DILocation(line: 94, column: 12, scope: !52)
!63 = !DILocation(line: 94, column: 5, scope: !52)
!64 = !DILocation(line: 96, column: 5, scope: !52)
!65 = !DILocation(line: 97, column: 5, scope: !52)
!66 = !DILocation(line: 98, column: 5, scope: !52)
!67 = !DILocation(line: 101, column: 5, scope: !52)
!68 = !DILocation(line: 102, column: 5, scope: !52)
!69 = !DILocation(line: 103, column: 5, scope: !52)
!70 = !DILocation(line: 105, column: 5, scope: !52)
!71 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 52, type: !13, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DILocalVariable(name: "data", scope: !71, file: !12, line: 54, type: !16)
!73 = !DILocation(line: 54, column: 12, scope: !71)
!74 = !DILocalVariable(name: "dataBuffer", scope: !71, file: !12, line: 55, type: !20)
!75 = !DILocation(line: 55, column: 10, scope: !71)
!76 = !DILocation(line: 56, column: 5, scope: !71)
!77 = !DILocation(line: 57, column: 5, scope: !71)
!78 = !DILocation(line: 57, column: 23, scope: !71)
!79 = !DILocation(line: 58, column: 5, scope: !71)
!80 = !DILocation(line: 61, column: 16, scope: !81)
!81 = distinct !DILexicalBlock(scope: !71, file: !12, line: 59, column: 5)
!82 = !DILocation(line: 61, column: 14, scope: !81)
!83 = !DILocation(line: 62, column: 9, scope: !81)
!84 = !DILocalVariable(name: "dest", scope: !85, file: !12, line: 65, type: !20)
!85 = distinct !DILexicalBlock(scope: !71, file: !12, line: 64, column: 5)
!86 = !DILocation(line: 65, column: 14, scope: !85)
!87 = !DILocation(line: 66, column: 9, scope: !85)
!88 = !DILocation(line: 67, column: 9, scope: !85)
!89 = !DILocation(line: 67, column: 21, scope: !85)
!90 = !DILocation(line: 69, column: 17, scope: !85)
!91 = !DILocation(line: 69, column: 23, scope: !85)
!92 = !DILocation(line: 69, column: 36, scope: !85)
!93 = !DILocation(line: 69, column: 29, scope: !85)
!94 = !DILocation(line: 69, column: 9, scope: !85)
!95 = !DILocation(line: 71, column: 9, scope: !85)
!96 = !DILocation(line: 71, column: 21, scope: !85)
!97 = !DILocation(line: 72, column: 19, scope: !85)
!98 = !DILocation(line: 72, column: 9, scope: !85)
!99 = !DILocation(line: 74, column: 1, scope: !71)

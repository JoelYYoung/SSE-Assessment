; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_strncpy_16.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_strncpy_16.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_char_strncpy_16_bad() #0 !dbg !11 {
entry:
  %data = alloca [150 x i8], align 16
  %dest = alloca [100 x i8], align 16
  br label %while.body, !dbg !15

while.body:                                       ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i8]* %data, metadata !16, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !24, metadata !DIExpression()), !dbg !28
  %arraydecay = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 0, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 149, i1 false), !dbg !29
  %arrayidx = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 149, !dbg !30
  store i8 0, i8* %arrayidx, align 1, !dbg !31
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !32
  %arraydecay2 = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 0, !dbg !33
  %call = call i8* @strncpy(i8* %arraydecay1, i8* %arraydecay2, i64 99) #5, !dbg !34
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !35
  call void @printLine(i8* %arraydecay3), !dbg !36
  br label %while.end, !dbg !37

while.end:                                        ; preds = %while.body
  ret void, !dbg !38
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8*, i8*, i64) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_char_strncpy_16_good() #0 !dbg !39 {
entry:
  call void @good1(), !dbg !40
  ret void, !dbg !41
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !42 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !48, metadata !DIExpression()), !dbg !49
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !50, metadata !DIExpression()), !dbg !51
  %call = call i64 @time(i64* null) #5, !dbg !52
  %conv = trunc i64 %call to i32, !dbg !53
  call void @srand(i32 %conv) #5, !dbg !54
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !55
  call void @CWE126_Buffer_Overread__CWE170_char_strncpy_16_good(), !dbg !56
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !57
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !58
  call void @CWE126_Buffer_Overread__CWE170_char_strncpy_16_bad(), !dbg !59
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !60
  ret i32 0, !dbg !61
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !62 {
entry:
  %data = alloca [150 x i8], align 16
  %dest = alloca [100 x i8], align 16
  br label %while.body, !dbg !63

while.body:                                       ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i8]* %data, metadata !64, metadata !DIExpression()), !dbg !67
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !68, metadata !DIExpression()), !dbg !69
  %arraydecay = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 0, !dbg !70
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 149, i1 false), !dbg !70
  %arrayidx = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 149, !dbg !71
  store i8 0, i8* %arrayidx, align 1, !dbg !72
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !73
  %arraydecay2 = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 0, !dbg !74
  %call = call i8* @strncpy(i8* %arraydecay1, i8* %arraydecay2, i64 99) #5, !dbg !75
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !76
  store i8 0, i8* %arrayidx3, align 1, !dbg !77
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !78
  call void @printLine(i8* %arraydecay4), !dbg !79
  br label %while.end, !dbg !80

while.end:                                        ; preds = %while.body
  ret void, !dbg !81
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_strncpy_16.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_char_strncpy_16_bad", scope: !12, file: !12, line: 22, type: !13, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_strncpy_16.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocation(line: 24, column: 5, scope: !11)
!16 = !DILocalVariable(name: "data", scope: !17, file: !12, line: 27, type: !19)
!17 = distinct !DILexicalBlock(scope: !18, file: !12, line: 26, column: 9)
!18 = distinct !DILexicalBlock(scope: !11, file: !12, line: 25, column: 5)
!19 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 1200, elements: !21)
!20 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!21 = !{!22}
!22 = !DISubrange(count: 150)
!23 = !DILocation(line: 27, column: 18, scope: !17)
!24 = !DILocalVariable(name: "dest", scope: !17, file: !12, line: 27, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 800, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 27, column: 29, scope: !17)
!29 = !DILocation(line: 29, column: 13, scope: !17)
!30 = !DILocation(line: 30, column: 13, scope: !17)
!31 = !DILocation(line: 30, column: 23, scope: !17)
!32 = !DILocation(line: 33, column: 21, scope: !17)
!33 = !DILocation(line: 33, column: 27, scope: !17)
!34 = !DILocation(line: 33, column: 13, scope: !17)
!35 = !DILocation(line: 35, column: 23, scope: !17)
!36 = !DILocation(line: 35, column: 13, scope: !17)
!37 = !DILocation(line: 37, column: 9, scope: !18)
!38 = !DILocation(line: 39, column: 1, scope: !11)
!39 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_char_strncpy_16_good", scope: !12, file: !12, line: 65, type: !13, scopeLine: 66, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!40 = !DILocation(line: 67, column: 5, scope: !39)
!41 = !DILocation(line: 68, column: 1, scope: !39)
!42 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 79, type: !43, scopeLine: 80, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!43 = !DISubroutineType(types: !44)
!44 = !{!45, !45, !46}
!45 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!46 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !47, size: 64)
!47 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!48 = !DILocalVariable(name: "argc", arg: 1, scope: !42, file: !12, line: 79, type: !45)
!49 = !DILocation(line: 79, column: 14, scope: !42)
!50 = !DILocalVariable(name: "argv", arg: 2, scope: !42, file: !12, line: 79, type: !46)
!51 = !DILocation(line: 79, column: 27, scope: !42)
!52 = !DILocation(line: 82, column: 22, scope: !42)
!53 = !DILocation(line: 82, column: 12, scope: !42)
!54 = !DILocation(line: 82, column: 5, scope: !42)
!55 = !DILocation(line: 84, column: 5, scope: !42)
!56 = !DILocation(line: 85, column: 5, scope: !42)
!57 = !DILocation(line: 86, column: 5, scope: !42)
!58 = !DILocation(line: 89, column: 5, scope: !42)
!59 = !DILocation(line: 90, column: 5, scope: !42)
!60 = !DILocation(line: 91, column: 5, scope: !42)
!61 = !DILocation(line: 93, column: 5, scope: !42)
!62 = distinct !DISubprogram(name: "good1", scope: !12, file: !12, line: 46, type: !13, scopeLine: 47, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DILocation(line: 48, column: 5, scope: !62)
!64 = !DILocalVariable(name: "data", scope: !65, file: !12, line: 51, type: !19)
!65 = distinct !DILexicalBlock(scope: !66, file: !12, line: 50, column: 9)
!66 = distinct !DILexicalBlock(scope: !62, file: !12, line: 49, column: 5)
!67 = !DILocation(line: 51, column: 18, scope: !65)
!68 = !DILocalVariable(name: "dest", scope: !65, file: !12, line: 51, type: !25)
!69 = !DILocation(line: 51, column: 29, scope: !65)
!70 = !DILocation(line: 53, column: 13, scope: !65)
!71 = !DILocation(line: 54, column: 13, scope: !65)
!72 = !DILocation(line: 54, column: 23, scope: !65)
!73 = !DILocation(line: 57, column: 21, scope: !65)
!74 = !DILocation(line: 57, column: 27, scope: !65)
!75 = !DILocation(line: 57, column: 13, scope: !65)
!76 = !DILocation(line: 58, column: 13, scope: !65)
!77 = !DILocation(line: 58, column: 22, scope: !65)
!78 = !DILocation(line: 59, column: 23, scope: !65)
!79 = !DILocation(line: 59, column: 13, scope: !65)
!80 = !DILocation(line: 61, column: 9, scope: !66)
!81 = !DILocation(line: 63, column: 1, scope: !62)
